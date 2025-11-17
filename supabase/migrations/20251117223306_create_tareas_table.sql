/*
  # Create tasks table

  1. New Tables
    - `tareas`
      - `id` (uuid, primary key)
      - `titulo` (text, task title)
      - `completada` (boolean, completion status)
      - `created_at` (timestamp)
  
  2. Security
    - Enable RLS on `tareas` table
    - Add public read/write policies (anonymous access)
*/

CREATE TABLE IF NOT EXISTS tareas (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  titulo text NOT NULL,
  completada boolean DEFAULT false,
  created_at timestamptz DEFAULT now()
);

ALTER TABLE tareas ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow public read"
  ON tareas
  FOR SELECT
  TO anon
  USING (true);

CREATE POLICY "Allow public insert"
  ON tareas
  FOR INSERT
  TO anon
  WITH CHECK (true);

CREATE POLICY "Allow public update"
  ON tareas
  FOR UPDATE
  TO anon
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Allow public delete"
  ON tareas
  FOR DELETE
  TO anon
  USING (true);