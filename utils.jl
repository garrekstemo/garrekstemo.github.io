function hfun_bar(vname)
  val = Meta.parse(vname[1])
  return round(sqrt(val), digits=2)
end

function hfun_m1fill(vname)
  var = vname[1]
  return pagevar("index", var)
end

function lx_baz(com, _)
  # keep this first line
  brace_content = Franklin.content(com.braces[1]) # input string
  # do whatever you want here
  return uppercase(brace_content)
end


"""
    {{{ listposts }}}

Generate list of posts.
"""
function hfun_listposts()
    currentyear = year(Dates.today())
    io = IOBuffer()

    for year in currentyear:-1:2020

        ys = "$year"
        year <= currentyear && write(io, "\n### $year \n")

        for month in 12:-1:1

            ms = "0"^(month < 10) * "$month"
            base = joinpath("posts", ys, ms)
            isdir(base) || continue
            posts = filter!(p -> endswith(p, ".md"), readdir(base))
            days = zeros(Int, length(posts))
            lines = Vector{String}(undef, length(posts))
            for (i, post) in enumerate(posts)

                ps = splitext(post)[1]
                url = "/posts/$ys/$ms/$ps"
                surl = strip(url, '/')
                title = pagevar(surl, :title)
                                title === nothing && (title = "Untitled")
                pubdate = pagevar(surl, :published)

                if isnothing(pubdate)
                    date = "$ys $ms 01"
                    days[i] = 1
                else
                    date = Date(pubdate, dateformat"d u Y")

                    days[i] = day(date)
                end
                lines[i] = "[$title]($url) &mdash; $pubdate"
            end

            foreach(line -> write(io, line), lines[sortperm(days, rev=true)])
        end
    end

    r = Franklin.fd2html(String(take!(io)), internal=true)
    return r
end

function hfun_insertmd(params)
    rpath = params[1]
    fullpath = joinpath(Franklin.path(:folder), rpath)
    isfile(fullpath) || return ""
    return read(fullpath, String)
end

function hfun_recentposts()
  curyear = Dates.Year(Dates.today()).value
  ntofind = 1
  nfound  = 0
  recent  = Vector{Pair{String,Date}}(undef, ntofind)
  for year in curyear:-1:2020
      for month in 12:-1:1
          ms = "0"^(1-div(month, 10)) * "$month"
          base = joinpath("posts", "$year", "$ms")
          isdir(base) || continue
          posts = filter!(p -> endswith(p, ".md"), readdir(base))
          days  = zeros(Int, length(posts))
          surls = Vector{String}(undef, length(posts))
          for (i, post) in enumerate(posts)
              ps       = splitext(post)[1]
              surl     = "posts/$year/$ms/$ps"
              surls[i] = surl
              pubdate  = pagevar(surl, :published)
              days[i]  = isnothing(pubdate) ?
                              1 : day(Date(pubdate, dateformat"d u Y"))
          end
          # go over month post in antichronological orders
          sp = sortperm(days, rev=true)
          for (i, surl) in enumerate(surls[sp])
              recent[nfound + 1] = (surl => Date(year, month, days[sp[i]]))
              nfound += 1
              nfound == ntofind && break
          end
          nfound == ntofind && break
      end
      nfound == ntofind && break
  end
  #
  io = IOBuffer()
  for (surl, date) in recent
      url   = "/$surl/"
      title = pagevar(surl, :title)
  title === nothing && (title = "Untitled")
      sdate = "$(day(date)) $(monthname(date)) $(year(date))"
      content = pagevar(surl, :fd_page_html)
      println(content)
      write(io, """
            <article>
              <h2><a href="$url">$title</a>
              </h2>
              <p>
                $sdate
                <a class="permalink" title="Permalink" href="$url">
                ⚓︎
                ︎</a>
              </p>
              $content
            </article>
          """)
  end
  return String(take!(io))
end
