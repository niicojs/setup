import { existsSync, rmSync } from 'node:fs';

console.log('Launch clean script...');

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

console.log('Done!');
