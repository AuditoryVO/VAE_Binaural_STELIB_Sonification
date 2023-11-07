## VAE Binaural Stellar Spectra exploration prototype. Case study: STELIB library (SVO).
![Stelib_Explorer](https://github.com/AdrianGRiber/VAE_Binaural_STELIB_Sonification/assets/79482127/a844bcb5-445b-4312-9301-c17205218e0b)

This repository contains two Jupyter notebooks used in the devopment of a three dimensional binaural sonification prototype that explores the STELIB stellar spectra library from the Spanish Virtual Observatory.

The first notebook (6D-VAE_STELIB-augmented.ipynb), is used to generate a six-dimensional variational autoencoder model that converts the stellar spectra into six-notes musical chords.

The second notebook (STELIB_Multimodal.ipynb), extracts the coordinates of the objects, calculates the graphics, converts the sppectra to chords and sends the output images and OSC messages to a multimodal display. 

In our case study, the multimodal display is implemented in CSound-Cabbage, and is also provided in this repository as a .csd file (STELIB-Explorer.csd).
Cabbage includes CSound audio engine and can be downloaded from: https://cabbageaudio.com/

This research is based on data from the STELIB service developed by the Spanish Virtual Observatory in the framework of the IAU Comission G5 Working Group : Spectral Stellar Libraries.

