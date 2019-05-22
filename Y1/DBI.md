# DBI Notes
## What is a Database?
- A shared collection of logically related data and a description of the data designed to meet the needs of an organisation
- They are important for computing:
  1. Many computing appliations deal with large numbers of information
  2. Database systems give a set of tools for storing, searching and managing this information
### Database Management System (DBMS)
- Software system that enables users to define, create, maintain and access the database

## The Relational Model
- Information stored as records in relations (tables)
### Terminologies
- Degree of a relation: how long each tuple is, or how many columns the table has
- Cardinality of a relation: how many different tuples there are, or how many rows a table has

## Candidate Keys
- A set of attributes in a relation is a candidate key iff:
  1. Every tuple has a unique value for that set of attributes: **uniqueness**
  2. No proper subset of the set has the uniqueness: **minimality**

## Primary Keys
- A candidate key is usually chosen to be a primary key
- Must be unique and not null

## Foreign Keys
- Used to link data in two relations
- A set of attributes in the first (referencing relation) relation is a Foreign Key if its value:
  1. Matches a Primary/Candidate Key value in a second (referenced) relation
  2. Is NULL
- This is called Referential Integrity

## Referential Integrity
- When relations are updated or deledted, referential integrity might be violated
- There are a number of options when this occurs:
  1. **RESTRICT**: stop the user from doing it
  2. **CASCADE**: let the changes flow on
  3. **SET NULL**: make referencing values null
  4. **SET DEFAULT**: make referencing values the default for their column
