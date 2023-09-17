# Metacells Vignettes

These vignettes give examples for using the [metacells](https://github.com/tanaylab/metacells), specifically version
0.9.0. They are not meant as a comprehensive documentation of all the features, and the data contained in them should
**not** be used for any serious analysis. They are just examples of the processes that one typically uses when using the
metacells package for analysis of scRNA-seq data.

## View the results

You can directly view the vignettes here:

* [One Pass Process](https://tanaylab.github.io/metacells-vignettes/one-pass.html)
* [Iterative Process](https://tanaylab.github.io/metacells-vignettes/iterative.html)
* [Projection Process](https://tanaylab.github.io/metacells-vignettes/projection.html)

## Re-run the vignettes

You will need the following software to be installed:

* The Python [metacells](https://github.com/tanaylab/metacells) package, of course.

* The Python `seaborn` package for generating graphs. Just `pip install seaborn`.

* An R environment.

* The R [MCView](https://github.com/tanaylab/MCView) package installed in it. See the installation instructions in the
  package (it is *not* a standard CRAN package).

* And, of course, a Jupyter setup that can access both the Python and R environments.

To get the Jupyter notebook sources, just `git clone` this repository. You can adapt the notebooks to use your own data,
of course. If you want to reproduce them, you'll need to get the data as well:

* First, `cd` into the cloned repository.

* Then, `wget https://metacells-vignette.s3.eu-west-1.amazonaws.com/blobs.tgz` to get the data files. This will download ~1GB of data.

* Finally, `tar xvzf blobs.tgz` which will extract the data files into the `blobs` directory, requiring ~6GB of disk space.

The data in these files comes from the following sources:

* Human Cell Atlas Bone Marrow Data from
  [here](https://data.humancellatlas.org/explore/projects/cc95ff89-2e68-4a08-a234-480eca21ce79?catalog=dcp1).

* Blood aging data from [here](https://elifesciences.org/articles/79363).

License (MIT)
-------------

Copyright © 2023 Weizmann Institute of Science

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
documentation files (the "Software"), to deal in the Software without restriction, including without limitation the
rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit
persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the
Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
