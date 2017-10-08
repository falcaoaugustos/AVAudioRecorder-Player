# AVAudioRecorder-Player

Boilerplate witch implements AVAudioRecorder and AVAudioPlayer objects.

## Features

* AVAudioRecorder object
* Selectable recorder delegate
* AVAudioPlayer object

## Preview

![PREVIEW_00](media/screenshot00.jpg)

## Usage

### Example

To run the example project, clone the repo, and build the project.

### Customization

You can implement your own recorder delegate object like this shown below:

```
import AVFoudation

class MyController: ViewController, AVAudioRecorderDelegate {

  let recorderManager = AudioRecorderManager()

  override func viewDidLoad() {
    super.viewDidLoad()
    recorderManager.set(recorderDelegate: self)
  }

  @IBAction func recordStart(_ sender: Any) {
    recorderManager.record()
  }

  @IBAction func recordFinish(_ sender: Any) {
    recorderManager.stop()
  }

  // MARK: Audio Recorder Delegate Methods

  func audioRecorderEncodeErrorDidOccur(_ recorder: AVAudioRecorder, error: Error?) {
    if let error = error {
      let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
      present(alert, animated: true, completion: nil)
    }
  }

  func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
    if (flag) {
      let alert = UIAlertController(title: "Success", message: "Congratulations, you did well!", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
      present(alert, animated: true, completion: nil)
    }
  }
}
```

## Contributing

Contributions are very welcome! If you'd like to contribute, feel free to send a pull request!

## License

AVAudioRecorder-Player is released under an MIT license. See LICENSE file for more information.
