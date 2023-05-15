## 3D Binaural Stellar Spectra exploration. Case study: STELIB library.
![image](https://github.com/AdrianGRiber/3D-Binaural-STELIB/assets/79482127/f59a2f54-a8ba-4edb-a31b-75a16024d7f3)
This repository contains two Jupyter notebooks used in the devopment of a three dimensional binaural stellar spectra sonification prototype that explores the STELIB stellar spectra from the Spanish Virtual Observatory.

The first notebook (6D-VAE_STELIB-augmented.ipynb), is used to generate a six-dimensional variational autoencoder model that converts the stellar spectra into six-notes musical chords.

The second notebook (STELIB_Multimodal.ipynb), extracts the coordinates of the objects, calculates the graphics, converts the sppectra to chords and sends the output images and OSC messages to a multimodal display. 

In our case study, the multimodal display is implemented in CSound-Cabbage and is available as .csd file (STELIB-Explorer.csd).
Cabbage includes CSound and can be downloaded at: https://cabbageaudio.com/

This research is based on data from the STELIB service developed by the Spanish Virtual Observatory in the framework of the IAU Comission G5 Working Group : Spectral Stellar Libraries.

