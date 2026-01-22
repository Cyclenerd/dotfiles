# Firefox

Firefox features can be configured using Group Policy templates on Windows, Intune on Windows, configuration profiles on macOS, or with a custom `policies.json` file.

You can check which policies are applied in Firefox by navigating to the `about:policies` page.

## Windows installation

```bat
mkdir C:\Program Files\Mozilla Firefox\distribution
copy policies.json C:\Program Files\Mozilla Firefox\distribution\
```

## macOS installation

**Note:**

1. You need to open Firefox at least one time before adding a configuration file, or macOS will identify Firefox as a damaged application.
1. Terminal needs Full Disk Access:
    1. Open System Settings (or System Preferences).
    1. Go to `Privacy & Security` > `Full Disk Access`.
    1. Find Terminal in the list and toggle the switch to On.

```bash
mkdir -p /Applications/Firefox.app/Contents/Resources/distribution
cp policies.json /Applications/Firefox.app/Contents/Resources/distribution/
```

To remove the custom configuration, delete the `policies.json` file from the distribution folder and restart Firefox.

## Linux installation

```bash
sudo mkdir -p /etc/firefox/policies
sudo cp policies.json /etc/firefox/policies/
```

## Documentation

- [Customize Firefox using policies.json](https://support.mozilla.org/en-US/kb/customizing-firefox-using-policiesjson)
- [Firefox policies list](https://mozilla.github.io/policy-templates/)
