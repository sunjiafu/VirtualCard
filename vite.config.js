import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';

export default defineConfig({
  plugins: [
    laravel({
      input: [
        'resources/sass/app.scss', // 添加 SCSS 文件入口
        'resources/js/app.js',
      ],
      refresh: true,
    }),
  ],
  css: {
    preprocessorOptions: {
      scss: {
        additionalData: '',
        sassOptions: {
          quietDeps: true, // 可选，抑制 Sass 弃用警告
        },
      },
    },
  },
});
