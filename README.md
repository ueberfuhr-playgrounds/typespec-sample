# TypeSpec sample

To build the OpenAPI spec, we use these commands:

```bash
# install TypeSpec Compiler
npm install -g npm \
  && npm install -g @typespec/compiler
# invoke TypeSpec compiler
tsp compile .
```

**PRO tip:**

On Mac, we could watch the file during development and run the compiler each time the file changes:

```bash
# install fswatch
brew install fswatch
fswatch *.tsp | xargs -n1 -I{} tsp compile .
```