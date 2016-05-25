# Software Development Practices

Best practices for software develompent at the [Sustainable Engineering Lab](http://modilabs.org) (SEL)

## Production

**Before** any software project goes production (i.e. has users other than the dev's building it), it must have ALL of the following:

1.  At least 90% code test coverage and assurance that functionality works as advertised
2.  Build automation such that pushes that break tests are detected.  [Travis](travis-ci.org) is the standard here.
3.  Code review and sign-off (with written feedback in the form of github issue(s)) by at least 1 other developer that the code is able to be maintained.  Focus should be on highlighting the difficult to understand areas of the code.
4.  Documentation such that others can develop and deploy the project

These guidelines are meant to ensure that code is kept simple and maintainable out of respect for current and future members of the lab.  Any projects that are out of compliance with these requirements must fulfill these before any new development is done.

The following are also recommended:

1.  Compliance with language specific guidelines (PEP8 for Python...)
2.  Performance benchmarks
3.  Security audit

### [Github Usage](github-usage)

Our recommended best practices for coordinating source code changes on the [SEL-Columbia](https://github.com/SEL-Columbia) github account.

See the [README.md](github-usage/README.md) in the [github-usage](github-usage) folder in this repo for specifics and examples.


### [Python](Python)

We observe the [PEP 8 Style Guide](http://www.python.org/dev/peps/pep-0008/) for [python code](http://www.python.org/).

When in doubt, fall back on the [Google Python Style Guide](https://google.github.io/styleguide/pyguide.html).  Of particular interest might be their detailed docstring guide, of which [this is a nice example](http://sphinxcontrib-napoleon.readthedocs.org/en/latest/example_google.html)

The [flake8](https://pypi.python.org/pypi/flake8) and [pylint](http://pylint.org/) utilities automatically check code for compliance with PEP 8, and so a [bash utility](Python/generate_qc_makefile.sh) has been provided which can run an entire set of python source code files from a given repo against it, and summarize the results in a markdown report file, while preserving the entire pylint report for each source code file.

If you use Vim, you can also use the [syntastic](https://github.com/scrooloose/syntastic) plugin to run flake8 automatically after each save.

	vim ~/.vimrc

		filetype off
		set rtp+=~/.vim/bundle/Vundle.vim
		call vundle#begin()
		Plugin 'gmarik/Vundle.vim'

		Plugin 'scrooloose/syntastic'
			set statusline+=%#warningmsg#
			set statusline+=%{SyntasticStatuslineFlag()}
			set statusline+=%*
			let g:syntastic_auto_loc_list=1
			let g:syntastic_check_on_wq = 0
			let g:syntastic_loc_list_height=3

		call vundle#end()
		filetype plugin indent on

	git clone --depth=1 https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall now &>/dev/null
	pip install -U flake8

See the [Python](Python) folder in this repo for more details.

### [Shell](shell)

We follow the [Google shell style guide](https://google.github.io/styleguide/shell.xml)
