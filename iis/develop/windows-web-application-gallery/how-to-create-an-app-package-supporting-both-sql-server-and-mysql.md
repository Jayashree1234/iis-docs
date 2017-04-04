---
title: "How to Create an App Package Supporting both SQL Server and MySQL | Microsoft Docs"
author: SunBuild
description: "Applications that currently support MySQL as their main DBMS can also support Microsoft SQL Server. The SQL Server Driver for PHP is available to PHP develop..."
ms.author: iiscontent
manager: soshir
ms.date: 02/16/2012
ms.topic: article
ms.assetid: 
ms.technology: iis-develop
ms.prod: iis
msc.legacyurl: /learn/develop/windows-web-application-gallery/how-to-create-an-app-package-supporting-both-sql-server-and-mysql
msc.type: authoredcontent
---
How to Create an App Package Supporting both SQL Server and MySQL
====================
by [Sunitha Muthukrishna](https://github.com/SunBuild)

Applications that currently support MySQL as their main DBMS can also support Microsoft SQL Server. [The SQL Server Driver for PHP](https://msdn.microsoft.com/en-us/library/cc296172(SQL.90).aspx) is available to PHP developers, it is a cost-effective and efficient solution for supporting SQL Server from within PHP applications. This article provides the steps needed for creating a Web Deployment package to install an application that supports both SQL Server and MySQL.

## Adding MySQL and SQL Server Databases

Add both directives dbfullsql and dbmysql to add a SQL Server database and a MySQL database within the Manifest.xml file.

[!code-xml[Main](how-to-create-an-app-package-supporting-both-sql-server-and-mysql/samples/sample1.xml)]

"path" attribute is used to set the path to the Sql scripts associated with the directive. You may add multiple dbfullsql/dbmysql directives within manifest file if you wish to use more than one Sql script for given database type.

## Adding SQL Server and MySQL parameters in Parameters.xml file

You need to create two sets of parameters one for SQL Server database and another for MySQL if they depend on the database type.

**Important Note: All the parameter names must be unique.**

Here is an example for Database Server parameter.

[!code-xml[Main](how-to-create-an-app-package-supporting-both-sql-server-and-mysql/samples/sample2.xml)]

[!code-xml[Main](how-to-create-an-app-package-supporting-both-sql-server-and-mysql/samples/sample3.xml)]

[!code-xml[Main](how-to-create-an-app-package-supporting-both-sql-server-and-mysql/samples/sample4.xml)]

Similarly you would need to create MySQL and SQL parameters each for Database username, Database user password, Database administrator, Database administrator password.

If user's choice is MySQL database during installation, the parameter "MSSQL Database Server" will be skipped and will not be visible to the user.   
  
 This allows you to set different default values, descriptions based on database type which makes it user-friendly. This feature also allows you to hide/show custom parameters specific to the application.

***For example:** *

If your application uses a Database type parameter in the application configuration file, say configuration.php; then we can parameter this in the parameters.xml as follows

[!code-xml[Main](how-to-create-an-app-package-supporting-both-sql-server-and-mysql/samples/sample5.xml)]

**Connection Strings**

Two connection string parameters must be included one for SQL server database parameters and one for MySQL database parameters.

[!code-xml[Main](how-to-create-an-app-package-supporting-both-sql-server-and-mysql/samples/sample6.xml)]