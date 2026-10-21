import { defineCollection, z } from 'astro:content';
import { glob, file } from 'astro/loaders';
const blog = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/blog' }),
  schema: z.object({
    title: z.string(),
    description: z.string(),
    pubDate: z.coerce.date(),
    updated: z.coerce.date().optional(),
    youtube: z.string().optional(),
    cover: z.string().optional(),
    tags: z.array(z.string()).default([]),
    draft: z.boolean().default(false),
  }),
});
const shortcuts = defineCollection({
  loader: file('src/data/shortcuts.json'),
  schema: z.object({
    slug: z.string(),
    order: z.number(),
    name: z.string(),
    category: z.string(),
    win: z.string().nullable(),
    mac: z.string().nullable(),
    summary: z.string(),
    steps: z.array(z.string()),
    tip: z.string(),
    note: z.string().nullable().optional(),
    youtube: z.string().nullable().optional(),
    keyword: z.string().nullable().optional(),
  }),
});
export const collections = { blog, shortcuts };
