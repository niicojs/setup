import { existsSync, rmSync } from 'node:fs';

import { $ } from 'dax';

console.log('Launch clean script...');

console.log('Removing old pnpm store...');

const userHome = process.env.HOME || process.env.USERPROFILE;

const to_remove = [
  `D:/.bin/.pnpm/store/v9`,
  `D:/.bin/.pnpm/store/v10`,
  `D:/.pnpm/store/v9`,
  `D:/.pnpm/store/v10`,
  `${userHome}/.pnpm-store/v10`,
];

for (const path of to_remove) {
  if (existsSync(path)) {
    console.log(`Removing ${path}...`);
    rmSync(path, { recursive: true, force: true });
  }
}

console.log('Update winget apps...');

await $`winget upgrade --all`;

console.log('Done!');
