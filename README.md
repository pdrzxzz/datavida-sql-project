# DataVida - Medical Diagnostic Center System  

## Overview  
A comprehensive **relational database system** designed for medical diagnostic centers to manage:  
- Patient scheduling and records  
- Medical examinations and diagnostics  
- Healthcare professionals (doctors, nurses, staff)  
- Insurance plan administration  
- Facility resource management  

*Note: This project was developed in Portuguese to meet academic requirements, with all documentation and database objects named accordingly.*  

## Core Functionality  
- **End-to-end patient workflow** from appointment to diagnosis  
- **Staff management** with role specialization (doctors, nurses, receptionists)  
- **Insurance plan integration** and patient coverage tracking  
- **Exam room allocation** and scheduling system  
- **Comprehensive reporting** for operational analytics  

## Technical Specifications  
- **Fully normalized relational model** (3NF and BCNF compliant)  
- **Entity-Relationship modeling** with proper handling of:  
  - Multi-valued attributes  
  - Composite attributes  
  - Inheritance relationships (staff roles)  
- **SQL implementation** with:  
  - Schema definition (`create_tables.sql`)  
  - Sample data (`seed.sql`)  
  - Operational queries (`query.sql`)  

## Development Team  
- Arthur Pomplilo  
- Emanuel Pedroza  
- Gabriel Fernandes  
- João Victor Cardoso  
- Leonardo Brahim  
- Paula Nóbrega  

*Developed as part of academic curriculum at Centro de Informática - UFPE*  

## Project Structure  
| File | Purpose |  
|------|---------|  
| `create_tables.sql` | Database schema definition |  
| `seed.sql` | Sample data population |  
| `query.sql` | Example operational queries |  
| `LICENSE` | Usage terms |  
| Documentation files | Project specifications and modeling details |  

The system provides a complete foundation for managing all aspects of a medical diagnostic center's operations.
