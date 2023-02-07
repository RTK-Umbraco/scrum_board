--
-- Class WorkItem as table work_item
--

CREATE TABLE "work_item" (
  "id" serial,
  "headline" text NOT NULL,
  "description" text NOT NULL
);

ALTER TABLE ONLY "work_item"
  ADD CONSTRAINT work_item_pkey PRIMARY KEY (id);


