%class SymbolicBayesTreeBase, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%SymbolicBayesTreeBase()
%
%-------Methods-------
%clear() : returns void
%clique(size_t j) : returns gtsam::SymbolicBayesTreeClique
%deleteCachedShortcuts() : returns void
%equals(SymbolicBayesTreeBase other, double tol) : returns bool
%insert(SymbolicBayesTreeClique subtree) : returns void
%numCachedSeparatorMarginals() : returns size_t
%print(string s) : returns void
%root() : returns gtsam::SymbolicBayesTreeClique
%saveGraph(string s) : returns void
%size() : returns size_t
%
classdef SymbolicBayesTreeBase < handle
  properties
    ptr_gtsamSymbolicBayesTreeBase = 0
  end
  methods
    function obj = SymbolicBayesTreeBase(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(1767, varargin{2});
        end
        gtsam_wrapper(1766, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(1768);
      else
        error('Arguments do not match any overload of gtsam.SymbolicBayesTreeBase constructor');
      end
      obj.ptr_gtsamSymbolicBayesTreeBase = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(1769, obj.ptr_gtsamSymbolicBayesTreeBase);
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
        gtsam_wrapper(1770, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicBayesTreeBase.clear');
      end
    end

    function varargout = clique(this, varargin)
      % CLIQUE usage: clique(size_t j) : returns gtsam::SymbolicBayesTreeClique
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % clique(size_t j)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        varargout{1} = gtsam_wrapper(1771, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicBayesTreeBase.clique');
      end
    end

    function varargout = deleteCachedShortcuts(this, varargin)
      % DELETECACHEDSHORTCUTS usage: deleteCachedShortcuts() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % deleteCachedShortcuts()
      if length(varargin) == 0
        gtsam_wrapper(1772, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicBayesTreeBase.deleteCachedShortcuts');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(SymbolicBayesTreeBase other, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(SymbolicBayesTreeBase other, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.SymbolicBayesTreeBase') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(1773, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicBayesTreeBase.equals');
      end
    end

    function varargout = insert(this, varargin)
      % INSERT usage: insert(SymbolicBayesTreeClique subtree) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % insert(SymbolicBayesTreeClique subtree)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.SymbolicBayesTreeClique')
        gtsam_wrapper(1774, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicBayesTreeBase.insert');
      end
    end

    function varargout = numCachedSeparatorMarginals(this, varargin)
      % NUMCACHEDSEPARATORMARGINALS usage: numCachedSeparatorMarginals() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % numCachedSeparatorMarginals()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1775, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicBayesTreeBase.numCachedSeparatorMarginals');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1776, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicBayesTreeBase.print');
      end
    end

    function varargout = root(this, varargin)
      % ROOT usage: root() : returns gtsam::SymbolicBayesTreeClique
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % root()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1777, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicBayesTreeBase.root');
      end
    end

    function varargout = saveGraph(this, varargin)
      % SAVEGRAPH usage: saveGraph(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % saveGraph(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1778, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicBayesTreeBase.saveGraph');
      end
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % size()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1779, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicBayesTreeBase.size');
      end
    end

  end

  methods(Static = true)
  end
end
