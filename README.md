## 3D-Binaural-STELIB
![image](https://github.com/AdrianGRiber/3D-Binaural-STELIB/assets/79482127/e17b5dc0-caea-4bff-b4cb-d6589937eba2)
This repository contains two Jupyter notebooks used in the devopment of a three dimensional binaural stellar spectra sonification prototype that explores the STELIB stellar spectra from the Spanish Virtual Observatory.

The first notebook (6D-VAE_STELIB-augmented.ipynb), is used to generate a six-dimensional variational autoencoder model used to convert stellar spectra into four-notes chords.

The second notebook (STELIB_Multimodal.ipynb), extracts the coordinates of the objects and sends OSC messages to a synthesizer. In our case study, the synthesizer was implemented using CSound-Cabbage

This research is based on data from the STELIB service developed by the Spanish Virtual Observatory in the framework of the IAU Comission G5 Working Group : Spectral Stellar Libraries.

