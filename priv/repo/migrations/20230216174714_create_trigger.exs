defmodule PhoenixDefault.Repo.Migrations.CreateTrigger do
  use Ecto.Migration
  def up do
    execute("""
      CREATE OR REPLACE FUNCTION notificar() RETURNS TRIGGER AS $$
      BEGIN
      PERFORM pg_notify(
        'financing_changed',
        json_build_object(
          'operation', TG_OP,
          'record', row_to_json(NEW)
        )::text
      );

      RETURN NEW;
      END;
      $$ LANGUAGE plpgsql;
    """)

    execute("""
      CREATE TRIGGER updated_financing
      AFTER INSERT OR UPDATE OF etapa, status
      ON financiamentos
      FOR EACH ROW
      EXECUTE FUNCTION notificar();
    """)
  end

  def down do
    execute("DROP FUNCTION notificar();")
    execute("DROP TRIGGER updated_financing ON financiamentos;")
  end
end
