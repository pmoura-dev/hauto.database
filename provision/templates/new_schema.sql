-- Create role if it doesn't exist
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = '$USER')
    THEN
        CREATE ROLE $USER LOGIN PASSWORD '$PASSWORD';
    END IF;
END
$$;

-- Create schema if it doesn't exist
CREATE SCHEMA IF NOT EXISTS $SCHEMA AUTHORIZATION $USER;
