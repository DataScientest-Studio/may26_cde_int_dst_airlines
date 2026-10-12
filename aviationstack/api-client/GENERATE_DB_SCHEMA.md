#Generate DB schema from OpenAPI Spec file

How to generate postgresql schema:

- Install java openjdk 21+

- Install OpenAPI Generator using pip: 

    pip install openapi-generator-cli

- Generate DB Schema: 

    openapi-generator-cli generate -i API-Endpoints.yaml -g postgresql-schema -o ./db_schema
    
