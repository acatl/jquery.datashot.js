jquery.datashot.js
==================

Give your elements a shot of data

**_NOTE: This plugin is not meant to replace templating_**

The idea is to help you inject data into your DOM (*instead of doing it manually*), by binding data paths to your html elements.

This is done by defining on each element a `data-ds` attribute that will point to the value on your model. 

The path is defined with standard dot and bracket notation.
Example:

```js
model.structure.array[2].inner.value
```

## how to use

Add a `data-ds` attribute to each element that you want data to be injected.

```html
<div class="my-target">
    <h1 data-ds="model.title"></h1>
    <p data-ds="model.description"></p>
    <button data-ds="model.list[0]"></button>
    <h2 data-ds="model.list[1].complex"></h2>
    <h3 data-ds="model.list[2][0]"></h3>
    <input data-ds="val:model.list[2][0]"/>
    <p data-ds="html:model.list[2][0]"/>
</div>​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​
```

Our model 

```js
var data = {
  model: {
    title: "Simple Templating",
    description: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit.",
    list: ["hello world", {complex:"woha"},["beat this"]],
    forInput: "have your say"
  }
};
```

Call the plugin

```js
$('.my-target').datashot(data);
```

See it in action: [jsfiddle example](http://jsfiddle.net/acatl/YADbb/)






