# OTP Authenticator

Two-factor authentication application for Android utilizing one-time password protocols:

| Name | Developer | OpenSource | Backup | Filter | Icon | Rename |
|------|-----------|------------|--------|--------|------|--------|
| [Google Authenticator](https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2) | Google | no | no (only tranfer) | no | no | only username (label) |
| [Microsoft Authenticator](https://play.google.com/store/apps/details?id=com.azure.authenticator) | Microsoft | no | yes (Cloud) | yes | no | only issuer |
| [FreeOTP Authenticator](https://play.google.com/store/apps/details?id=org.fedorahosted.freeotp) | RedHat | [yes](https://github.com/freeotp/freeotp-android) | yes | no | yes (only by name) | yes |
| [andOTP - OTP Authenticator](https://play.google.com/store/apps/details?id=org.shadowice.flocke.andotp) | [Jakob N.](https://github.com/flocke) | [yes](https://github.com/andOTP/andOTP) (unmaintained!) | yes | yes | yes | yes |
| [Aegis Authenticator - 2FA App](https://play.google.com/store/apps/details?id=com.beemdevelopment.aegis) | [Michael S.](https://github.com/michaelschattgen), [Alexander B.](https://github.com/alexbakker) | [yes](https://github.com/beemdevelopment/Aegis) | yes | yes | yes | yes |

My personal ranking:

1. [Aegis Authenticator - 2FA App](https://play.google.com/store/apps/details?id=com.beemdevelopment.aegis)
    * All required (and even more) functions
    * 
    * In active development (5,3k GitHub stars)
1. [andOTP - OTP Authenticator](https://play.google.com/store/apps/details?id=org.shadowice.flocke.andotp)
    * All required functions
    * Several years in use
    * Data survived several moves to new smartphones
    * Unfortunately no longer in active development (since 2021)
1. [Microsoft Authenticator](https://play.google.com/store/apps/details?id=com.azure.authenticator)
    * Also provides many of the required functions
    * Unfortunately not OpenSource and only Cloud backup
    * Official product from Microsoft
    * Also available for iOS
1. [FreeOTP Authenticator](https://play.google.com/store/apps/details?id=org.fedorahosted.freeotp)
    * Here I really miss a filter to find my many entries quickly
1. [Google Authenticator](https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2)
    * Far too minimalistic
    * Since there are super alternatives, I can not recommend this app at all

## Aegis

More for Aegis Authenticator:

* [Icons](https://aegis-icons.github.io/)
* [Simple Icons](https://github.com/alexbakker/aegis-simple-icons)
* [CLI](https://github.com/navilg/aegis-cli)