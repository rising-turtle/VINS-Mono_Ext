%class ISAM2BayesTree, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%ISAM2BayesTree()
%
%-------Methods-------
%clear() : returns void
%clique(size_t j) : returns gtsam::ISAM2Clique
%deleteCachedShortcuts() : returns void
%equals(ISAM2BayesTree other, double tol) : returns bool
%insert(ISAM2Clique subtree) : returns void
%numCachedSeparatorMarginals() : returns size_t
%print(string s) : returns void
%root() : returns gtsam::ISAM2Clique
%saveGraph(string s) : returns void
%size() : returns size_t
%
classdef ISAM2BayesTree < handle
  properties
    ptr_gtsamISAM2BayesTree = 0
  end
  methods
    function obj = ISAM2BayesTree(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(1826, varargin{2});
        end
        gtsam_wrapper(1825, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(1827);
      else
        error('Arguments do not match any overload of gtsam.ISAM2BayesTree constructor');
      end
      obj.ptr_gtsamISAM2BayesTree = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(1828, obj.ptr_gtsamISAM2BayesTree);
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
        gtsam_wrapper(1829, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2BayesTree.clear');
      end
    end

    function varargout = clique(this, varargin)
      % CLIQUE usage: clique(size_t j) : returns gtsam::ISAM2Clique
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % clique(size_t j)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        varargout{1} = gtsam_wrapper(1830, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2BayesTree.clique');
      end
    end

    function varargout = deleteCachedShortcuts(this, varargin)
      % DELETECACHEDSHORTCUTS usage: deleteCachedShortcuts() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % deleteCachedShortcuts()
      if length(varargin) == 0
        gtsam_wrapper(1831, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2BayesTree.deleteCachedShortcuts');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(ISAM2BayesTree other, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(ISAM2BayesTree other, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.ISAM2BayesTree') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(1832, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2BayesTree.equals');
      end
    end

    function varargout = insert(this, varargin)
      % INSERT usage: insert(ISAM2Clique subtree) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % insert(ISAM2Clique subtree)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.ISAM2Clique')
        gtsam_wrapper(1833, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2BayesTree.insert');
      end
    end

    function varargout = numCachedSeparatorMarginals(this, varargin)
      % NUMCACHEDSEPARATORMARGINALS usage: numCachedSeparatorMarginals() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % numCachedSeparatorMarginals()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1834, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2BayesTree.numCachedSeparatorMarginals');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1835, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2BayesTree.print');
      end
    end

    function varargout = root(this, varargin)
      % ROOT usage: root() : returns gtsam::ISAM2Clique
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % root()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1836, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2BayesTree.root');
      end
    end

    function varargout = saveGraph(this, varargin)
      % SAVEGRAPH usage: saveGraph(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % saveGraph(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1837, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2BayesTree.saveGraph');
      end
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % size()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1838, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2BayesTree.size');
      end
    end

  end

  methods(Static = true)
  end
end
