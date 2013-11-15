# What is Page Barfer?

Page Barfer is an import/export gem that takes a list of items and related attributes and creates an HTML page for each item.

The first release will:

* Assist folks creating [Jekyll static sites](http://jekyllrb.com/) that need a bunch of pages created from something structurally similar to a product catalog
* Import from json and xml files
* Sit in a Jekyll project folder without destroying anything Jekyll does

## Usage Scenario

Susan has a client that wants a website to display their product catalog. Susan is going to use Jekyll to build out her client's site. She wants to use Jekyll's layouts but doesn't want the content to be treated as blog content. Susan will also use [lunr.js](https://github.com/slashdotdash/jekyll-lunr-js-search) to provide search capabilities for her client's products. After some initial setup, the Page Barfer spits out what Susan needs:

A product page for each product, with all of her attributes placed in her layout, along with index pages for each category.