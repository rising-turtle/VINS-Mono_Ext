%class SymbolicBayesNet, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%SymbolicBayesNet()
%SymbolicBayesNet(SymbolicBayesNet bn)
%SymbolicBayesNet(IndexConditional conditional)
%
%-------Methods-------
%permuteWithInverse(Permutation inversePermutation) : returns void
%pop_front() : returns void
%
classdef SymbolicBayesNet < gtsam.SymbolicBayesNetBase
  properties
    ptr_gtsamSymbolicBayesNet = 0
  end
  methods
    function obj = SymbolicBayesNet(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(423, varargin{2});
        end
        base_ptr = gtsam_wrapper(422, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_wrapper(424);
      elseif nargin == 1 && isa(varargin{1},'gtsam.SymbolicBayesNet')
        [ my_ptr, base_ptr ] = gtsam_wrapper(425, varargin{1});
      elseif nargin == 1 && isa(varargin{1},'gtsam.IndexConditional')
        [ my_ptr, base_ptr ] = gtsam_wrapper(426, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.SymbolicBayesNet constructor');
      end
      obj = obj@gtsam.SymbolicBayesNetBase(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamSymbolicBayesNet = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(427, obj.ptr_gtsamSymbolicBayesNet);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = permuteWithInverse(this, varargin)
      % PERMUTEWITHINVERSE usage: permuteWithInverse(Permutation inversePermutation) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % permuteWithInverse(Permutation inversePermutation)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Permutation')
        gtsam_wrapper(428, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicBayesNet.permuteWithInverse');
      end
    end

    function varargout = pop_front(this, varargin)
      % POP_FRONT usage: pop_front() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % pop_front()
      if length(varargin) == 0
        gtsam_wrapper(429, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicBayesNet.pop_front');
      end
    end

  end

  methods(Static = true)
  end
end
