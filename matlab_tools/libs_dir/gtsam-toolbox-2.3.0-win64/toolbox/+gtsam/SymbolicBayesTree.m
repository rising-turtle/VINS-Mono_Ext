%class SymbolicBayesTree, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%SymbolicBayesTree()
%SymbolicBayesTree(SymbolicBayesNet bn)
%SymbolicBayesTree(SymbolicBayesTree other)
%
%-------Methods-------
%findParentClique(IndexConditional parents) : returns size_t
%
classdef SymbolicBayesTree < gtsam.SymbolicBayesTreeBase
  properties
    ptr_gtsamSymbolicBayesTree = 0
  end
  methods
    function obj = SymbolicBayesTree(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(431, varargin{2});
        end
        base_ptr = gtsam_wrapper(430, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_wrapper(432);
      elseif nargin == 1 && isa(varargin{1},'gtsam.SymbolicBayesNet')
        [ my_ptr, base_ptr ] = gtsam_wrapper(433, varargin{1});
      elseif nargin == 1 && isa(varargin{1},'gtsam.SymbolicBayesTree')
        [ my_ptr, base_ptr ] = gtsam_wrapper(434, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.SymbolicBayesTree constructor');
      end
      obj = obj@gtsam.SymbolicBayesTreeBase(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamSymbolicBayesTree = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(435, obj.ptr_gtsamSymbolicBayesTree);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = findParentClique(this, varargin)
      % FINDPARENTCLIQUE usage: findParentClique(IndexConditional parents) : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % findParentClique(IndexConditional parents)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.IndexConditional')
        varargout{1} = gtsam_wrapper(436, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicBayesTree.findParentClique');
      end
    end

  end

  methods(Static = true)
  end
end
