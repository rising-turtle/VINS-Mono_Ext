%class IndexConditional, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%IndexConditional()
%IndexConditional(size_t key)
%IndexConditional(size_t key, size_t parent)
%IndexConditional(size_t key, size_t parent1, size_t parent2)
%IndexConditional(size_t key, size_t parent1, size_t parent2, size_t parent3)
%
%-------Methods-------
%equals(IndexConditional other, double tol) : returns bool
%nrFrontals() : returns size_t
%nrParents() : returns size_t
%permuteWithInverse(Permutation inversePermutation) : returns void
%print(string s) : returns void
%toFactor() : returns gtsam::IndexFactor
%
classdef IndexConditional < handle
  properties
    ptr_gtsamIndexConditional = 0
  end
  methods
    function obj = IndexConditional(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(409, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(410);
      elseif nargin == 1 && isa(varargin{1},'numeric')
        my_ptr = gtsam_wrapper(411, varargin{1});
      elseif nargin == 2 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric')
        my_ptr = gtsam_wrapper(412, varargin{1}, varargin{2});
      elseif nargin == 3 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric') && isa(varargin{3},'numeric')
        my_ptr = gtsam_wrapper(413, varargin{1}, varargin{2}, varargin{3});
      elseif nargin == 4 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric') && isa(varargin{3},'numeric') && isa(varargin{4},'numeric')
        my_ptr = gtsam_wrapper(414, varargin{1}, varargin{2}, varargin{3}, varargin{4});
      else
        error('Arguments do not match any overload of gtsam.IndexConditional constructor');
      end
      obj.ptr_gtsamIndexConditional = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(415, obj.ptr_gtsamIndexConditional);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = equals(this, varargin)
      % EQUALS usage: equals(IndexConditional other, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(IndexConditional other, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.IndexConditional') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(416, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.IndexConditional.equals');
      end
    end

    function varargout = nrFrontals(this, varargin)
      % NRFRONTALS usage: nrFrontals() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % nrFrontals()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(417, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.IndexConditional.nrFrontals');
      end
    end

    function varargout = nrParents(this, varargin)
      % NRPARENTS usage: nrParents() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % nrParents()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(418, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.IndexConditional.nrParents');
      end
    end

    function varargout = permuteWithInverse(this, varargin)
      % PERMUTEWITHINVERSE usage: permuteWithInverse(Permutation inversePermutation) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % permuteWithInverse(Permutation inversePermutation)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Permutation')
        gtsam_wrapper(419, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.IndexConditional.permuteWithInverse');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(420, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.IndexConditional.print');
      end
    end

    function varargout = toFactor(this, varargin)
      % TOFACTOR usage: toFactor() : returns gtsam::IndexFactor
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % toFactor()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(421, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.IndexConditional.toFactor');
      end
    end

  end

  methods(Static = true)
  end
end
