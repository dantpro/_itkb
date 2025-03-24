// enumeratinginstalledproviders.cpp : Defines the entry point for the console application.
//
/////////////////////////////////////////////////////////////////////
// EnumProviders.cpp
// Enumerate the cryptographic providers installed on the
// computer. This sample enumerates the Cryptography API
// (CryptoAPI) and Cryptography API: Next Generation (CNG)
// providers.

#include <certenroll.h>
#include <windows.h>
#include <stdio.h>
#include <conio.h>
#include <tchar.h>
#include <atlbase.h>

// Forward declaration.
HRESULT enumProviders(void);

int _tmain(int argc, _TCHAR* argv[])
{
    UNREFERENCED_PARAMETER(argc);
    UNREFERENCED_PARAMETER(argv);
    
    HRESULT hr = S_OK;

    // Initialize COM.
    hr = CoInitializeEx(NULL, COINIT_APARTMENTTHREADED);
    if(FAILED(hr)) return hr;

    // Enumerate the CryptoAPI and CNG providers.
    hr = enumProviders();
    CoUninitialize();
    return hr;
}

HRESULT enumProviders(void)
{
    CComPtr<ICspInformations> pCSPs;    // Provider collection
    CComPtr<ICspInformation> pCSP;      // Provider instgance
    HRESULT hr = S_OK;                  // Return value
    long lCount = 0;                    // Count of providers
    CComBSTR bstrName;                  // Provider name
    VARIANT_BOOL bLegacy;               // CryptoAPI or CNG

    // Create a collection of cryptographic providers.
    hr = CoCreateInstance(
        __uuidof(CCspInformations),
        NULL,
        CLSCTX_INPROC_SERVER,
        __uuidof(ICspInformations),
        (void **) &pCSPs);

        if(FAILED(hr)) return hr;

    // Add the providers installed on the computer.
    hr = pCSPs->AddAvailableCsps();
    if(FAILED(hr)) return hr;

    // Retrieve the number of installed providers.
    hr = pCSPs->get_Count(&lCount);
    if(FAILED(hr)) return hr;

    // Print the providers to the console. Print the
    // name and a value that specifies whether the
    // CSP is a legacy or CNG provider.
    for (long i=0; i<lCount; i++)
    {
        hr = pCSPs->get_ItemByIndex(i, &pCSP);
        if(FAILED(hr)) return hr;

        hr = pCSP->get_Name(&bstrName);
        if(FAILED(hr)) return hr;

        hr = pCSP->get_LegacyCsp(&bLegacy);
        if(FAILED(hr)) return hr;

        if(VARIANT_TRUE == bLegacy)
            wprintf_s(L"%2d. Legacy: ", i);
        else
            wprintf_s(L"%2d. CNG: ", i);

        wprintf_s(L"%s\n", static_cast<wchar_t*>(bstrName.m_str));

        pCSP=NULL;
    }

    printf_s("\n\nHit any key to continue: ");
    _getch();
    
    return hr;
}
