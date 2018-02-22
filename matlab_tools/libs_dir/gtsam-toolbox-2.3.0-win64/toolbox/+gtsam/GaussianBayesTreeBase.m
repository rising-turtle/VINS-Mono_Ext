%class GaussianBayesTreeBase, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%GaussianBayesTreeBase()
%
%-------Methods-------
%clear() : returns void
%clique(size_t j) : returns gtsam::GaussianBayesTreeClique
%deleteCachedShortcuts() : returns void
%equals(GaussianBayesTreeBase other, double tol) : returns bool
%insert(GaussianBayesTreeClique subtree) : returns void
%numCachedSeparatorMarginals() : returns size_t
%print(string s) : returns void
%root() : returns gtsam::GaussianBayesTreeClique
%saveGraph(string s) : returns void
%size() : returns size_t
%
classdef GaussianBayesTreeBase < handle
  properties
    ptr_gtsamGaussianBayesTreeBase = 0
  end
  methods
    function obj = GaussianBayesTreeBase(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(1812, varargin{2});
        end
        gtsam_wrapper(1811, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(1813);
      else
        error('Arguments do not match any overload of gtsam.GaussianBayesTreeBase constructor');
      end
      obj.ptr_gtsamGaussianBayesTreeBase = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(1814, obj.ptr_gtsamGaussianBayesTreeBase);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = clear(this, varargin)
      % CLEAR usage: clear() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % clear()
      if length(varargin) == 0
        gtsam_wrapper(1815, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesTreeBase.clear');
      end
    end

    function varargout = clique(this, varargin)
      % CLIQUE usage: clique(size_t j) : returns gtsam::GaussianBayesTreeClique
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % clique(size_t j)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        varargout{1} = gtsam_wrapper(1816, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesTreeBase.clique');
      end
    end

    function varargout = deleteCachedShortcuts(this, varargin)
      % DELETECACHEDSHORTCUTS usage: deleteCachedShortcuts() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % deleteCachedShortcuts()
      if length(varargin) == 0
        gtsam_wrapper(1817, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesTreeBase.deleteCachedShortcuts');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(GaussianBayesTreeBase other, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(GaussianBayesTreeBase other, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.GaussianBayesTreeBase') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(1818, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesTreeBase.equals');
      end
    end

    function varargout = insert(this, varargin)
      % INSERT usage: insert(GaussianBayesTreeClique subtree) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % insert(GaussianBayesTreeClique subtree)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.GaussianBayesTreeClique')
        gtsam_wrapper(1819, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesTreeBase.insert');
      end
    end

    function varargout = numCachedSeparatorMarginals(this, varargin)
      % NUMCACHEDSEPARATORMARGINALS usage: numCachedSeparatorMarginals() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % numCachedSeparatorMarginals()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1820, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesTreeBase.numCachedSeparatorMarginals');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1821, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesTreeBase.print');
      end
    end

    function varargout = root(this, varargin)
      % ROOT usage: root() : returns gtsam::GaussianBayesTreeClique
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % root()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1822, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesTreeBase.root');
      end
    end

    function varargout = saveGraph(this, varargin)
      % SAVEGRAPH usage: saveGraph(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % saveGraph(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1823, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesTreeBase.saveGraph');
      end
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % size()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1824, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesTreeBase.size');
      end
    end

  end

  methods(Static = true)
  end
end
