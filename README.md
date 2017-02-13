Build and test your android project in docker.

# Agree the SDK licenses

For security considerations, a simple tool named `agree-license.sh` is provided. Use it with variable features of CI to prevent showing your license hash to public.

```sh
agree-license.sh android-sdk-license 1234567890123456789012345678901234567890
```

Correct filename and hash code can be found at `/path_to_your_android_sdk/licenses/`.

### Example with drone-ci 0.5

* Add an `secret` named `ANDROID_SDK_LICENSE` using drone cli tool.
* Add following line to `before_script` section of `.drone.yml`:

```
  - agree-license.sh android-sdk-license ${ANDROID_SDK_LICENSE}
```

* Add workspace settings of `.drone.yml`:

```yaml
workspace:
  base: /workspace
```

* You might want to use [volume cache plugin](http://plugins.drone.io/drillster/drone-volume-cache/) (or other cache plugins) for caching gradle resources.
* Happy building.

# Why only API 25 is supported

I'm just a newbie to android app developing world. I have no idea about the dependency of elder versions, since the only project I've ever written is for API 25.

PR is welcome anyway.
