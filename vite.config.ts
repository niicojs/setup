import { defineConfig } from 'vite-plus';

export default defineConfig({
  fmt: { printWidth: 120, singleQuote: true, sortImports: true, endOfLine: 'crlf' },
  lint: { options: { typeAware: true, typeCheck: true } },
});
