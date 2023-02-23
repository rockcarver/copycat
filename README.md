# CopyCat
CopyCat is a wrapper for Frodo.  Now supports Encore environments as well.

# ForgeRock ToolBox

Welcome to 'CopyCat', your one-stop-shop for exporting, importing, and out right cloning and entire environemt.
This tool now supports both Identity Cloud, Self-Managed for SE (Catlayst & Encore) and Custom URL (for customers).

When prompted to enter your 'Namespace', this will be the actual name of the environment itself.
For example, if the Identity Cloud URL is:  https://openam-bob-demo.forgeblocks.com', then the 'namespace' would be:  bob-demo.
Conversely, if you are working with a Catalyst deployment and the URL is: https://healthcare-demo.catalyst.forgerock.org',
then the 'namespace' would be:  'healthcare-demo'.

## DEVELOPER'S NOTES

EXPORTING
The export portion of this tool will create both a 'parent directory' for the source environment, followed by a series of sub-directories.
It is HIGHLY recommended to place this script in whatever directory will house any and all 'parent' directories.
In my case it's:  /Users/<my name>/Environments

This tool will also create an empty file in the user's home directory named after the namespaace.
This is done to prevent error messages on future execution for the same namespace.

IMPORTING
The import portion of this tool ONLY REQUIRES the existence of the "namespace" directory structure if you are duplicating environments
(which should have been created via the EXPORT utility).  Otherwise, you can enter the source namespace (i.e. you exported from
HC-demo71c but are now importing into HC-demo71d).

CLONING
In an effort to support this functionality, the 'IMPORT' process was adjusted in order to ask the user whether or not the destination
will be populated by data with the same target URL.  If not, you will enter that information so the proper conversion routine can
happen behind the scenes (prior to import)


*** EXECUTION ***
Ensure this tool is located (and executed) in the directory which houses the parent namespace folders.
In my case it is:  /Users/<my name>/Environments.

You will have to CHMOD the master script before running:   chmod 777 CopyCat3.sh
