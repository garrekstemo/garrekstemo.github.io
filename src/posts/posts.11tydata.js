module.exports = {
  layout: "layouts/post.liquid",
  eleventyComputed: {
    permalink: (data) => {
      const d = data.page.date;
      const year = d.getUTCFullYear();
      const month = String(d.getUTCMonth() + 1).padStart(2, "0");
      const day = String(d.getUTCDate()).padStart(2, "0");
      // Strip the date prefix from the file slug
      const slug = data.page.fileSlug.replace(/^\d{4}-\d{2}-\d{2}-/, "");
      return `/${year}/${month}/${day}/${slug}.html`;
    },
  },
};
