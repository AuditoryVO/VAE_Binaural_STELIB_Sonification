## VAE Binaural Stellar Spectra exploration prototype. Case study: STELIB library (SVO).
![Stelib_Explorer](https://github.com/AdrianGRiber/VAE_Binaural_STELIB_Sonification/assets/79482127/a844bcb5-445b-4312-9301-c17205218e0b)

DESCRIPTION

This repository contains two Jupyter notebooks used in the devopment of a three dimensional binaural sonification prototype that explores the STELIB stellar spectra library from the Spanish Virtual Observatory.

The first notebook (6D-VAE_STELIB-augmented.ipynb), is used to generate a six-dimensional variational autoencoder model that converts the stellar spectra into six-notes musical chords.

The second notebook (STELIB_Multimodal.ipynb), extracts the coordinates of the objects, calculates the graphics, converts the spectra to chords, and sends the output images and OSC messages to the multimodal display implemented in Cabbage/CSound. 

The multimodal display is also provided in this repository as a .csd file (STELIB-Explorer.csd).

This research is based on data from the STELIB service developed by the Spanish Virtual Observatory in the framework of the IAU Comission G5 Working Group : Spectral Stellar Libraries.

CONTENTS

- Jupyter notebook 1: 6D-VAE_STELIB-augmented.ipynb
- Jupyter notebook 2: Stelib-Multimodal.ipynb
- CSound/Cabbage file: STELIB-Explorer.csd
- Sample images: Sky.png, Star.png, and Plot.png
- Cabbage mask files: Init.png, Init2.png, and Init3.png
- HRTF files: hrtf-48000-left.dat, and hrtf-48000-right.dat
- LICENSE
- README
- requirements.txt



INSTALLATION

1- Download and install CSound 6.15 from: https://github.com/csound/csound/releases/tag/6.15.0

2- Download Cabbage from: https://cabbageaudio.com/download/ 

3- Install only Cabbage from the downloaded Cabbage package.

   Warning: The latest version of Cabbage allows to optionally install the latest version of CSound. This default option should be unchecked not to overwrite CSound 6.15.
   Latests versions of CSound require additional plugins to work with the image CSound opcodes, so they should not be used.

4- Download the data from: http://svocats.cab.inta-csic.es/stelib/index.php?action=search

5- Download all the content of this repository into the same folder

6- Launch Cabbage, open Stelib_Explorer.csd, and press play

7- Add your path to the downloaded files and run all the cells of Jupyter notebook 2 (Stelib-Multimodal.ipynb) to the sequence

Enjoy the sonifications!



