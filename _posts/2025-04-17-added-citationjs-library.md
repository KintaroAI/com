---
layout: post
title:  "Citation.js Library Added for Easy Bibliography Management"
date:   2025-04-17
categories: update library tools
---

We're happy to announce that the [Citation.js](https://citation.js.org/) library has been integrated into our website!

## What is Citation.js?

Citation.js is a powerful JavaScript library that makes it easy to work with bibliographic data. It can parse various formats like BibTeX, BibJSON, Wikidata IDs, DOIs, and more. Once parsed, it can format this data into common citation styles (like APA, MLA, Vancouver) or other formats like BibTeX or RIS.

This means we can now easily generate properly formatted citations and bibliographies directly within our site content.

## How to Use It (Example)

You can use the `citation.js` library directly in your pages or posts using JavaScript. Here's a simple example demonstrating how to format a DOI into an APA-style bibliography entry:

First, add a placeholder element where you want the citation to appear:

```html
<div id="citation-output"></div>
```

Then, add a script tag to fetch the data and format it:

```html
<script>
  // Ensure the Cite object is available from the loaded citation.min.js
  if (typeof Cite !== 'undefined') {
    // Example DOI
    const doi = '10.7717/peerj-cs.214'; // Citation.js paper DOI

    // Use Cite.async to fetch and parse the DOI
    Cite.async(doi).then(data => {
      // Format the data as an APA bibliography entry (HTML)
      const bibliography = data.format('bibliography', {
        format: 'html',
        template: 'apa', // APA style
        lang: 'en-US'     // English language
      });

      // Insert the formatted bibliography into our placeholder div
      const outputDiv = document.getElementById('citation-output');
      if (outputDiv) {
        outputDiv.innerHTML = bibliography;
      } else {
        console.error('Citation output element not found.');
      }

    }).catch(error => {
      console.error('Error processing DOI with Citation.js:', error);
      const outputDiv = document.getElementById('citation-output');
      if (outputDiv) {
        outputDiv.innerHTML = 'Could not generate citation.';
      }
    });

  } else {
    console.error('Citation.js (Cite object) not found.');
    const outputDiv = document.getElementById('citation-output');
      if (outputDiv) {
        outputDiv.innerHTML = 'Citation library not loaded.';
      }
  }
</script>
```

This example will fetch the metadata for the given DOI and display a formatted APA citation in the `<div>` element.

We hope this library proves useful for managing and displaying citations on the site!
