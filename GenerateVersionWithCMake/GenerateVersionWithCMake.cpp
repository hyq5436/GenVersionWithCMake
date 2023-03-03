// GenerateVersionWithCMake.cpp : Defines the entry point for the application.
//

#include "GenerateVersionWithCMake.h"
#include <string>
#include "gitversion.h"

using namespace std;


int main()
{
	cout << "GIT BUILD VERSION: " << GIT_REVISION << endl;
	return 0;
}
