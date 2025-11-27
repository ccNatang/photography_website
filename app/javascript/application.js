// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "./controllers"
import React from "react";
import { createRoot } from "react-dom/client";
import HelloWorld from "./components/HelloWorld";

console.log("1. Application.js is running!");

document.addEventListener("turbo:load", () => {
  console.log("2. Turbo load event fired!");
  const rootElement = document.getElementById("react-root");
  
  if (rootElement) {
    console.log("3. Found the root element! Mounting React...");
    const root = createRoot(rootElement);
    root.render(<HelloWorld />);
  } else {
    console.log("3. ERROR: Could not find element with id 'react-root'");
  }
});