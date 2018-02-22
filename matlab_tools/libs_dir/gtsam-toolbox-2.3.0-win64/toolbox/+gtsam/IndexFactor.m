%class IndexFactor, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%IndexFactor(IndexFactor f)
%IndexFactor(IndexConditional c)
%IndexFactor()
%IndexFactor(size_t j)
%IndexFactor(size_t j1, size_t j2)
%IndexFactor(size_t j1, size_t j2, size_t j3)
%IndexFactor(size_t j1, size_t j2, size_t j3, size_t j4)
%IndexFactor(size_t j1, size_t j2, size_t j3, size_t j4, size_t j5)
%IndexFactor(size_t j1, size_t j2, size_t j3, size_t j4, size_t j5, size_t j6)
%
%-------Methods-------
%equals(IndexFactor other, double tol) : returns bool
%permuteWithInverse(Permutation inversePermutation) : returns void
%print(string s) : returns void
%size() : returns size_t
%
classdef IndexFactor < handle
  properties
    ptr_gtsamIndexFactor = 0
  end
  methods
    function obj = IndexFactor(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(394, my_ptr);
      elseif nargin == 1 && isa(varargin{1},'gtsam.IndexFactor')
        my_ptr = gtsam_wrapper(395, varargin{1});
      elseif nargin == 1 && isa(varargin{1},'gtsam.IndexConditional')
        my_ptr = gtsam_wrapper(396, varargin{1});
      elseif nargin == 0
        my_ptr = gtsam_wrapper(397);
      elseif nargin == 1 && isa(varargin{1},'numeric')
        my_ptr = gtsam_wrapper(398, varargin{1});
      elseif nargin == 2 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric')
        my_ptr = gtsam_wrapper(399, varargin{1}, varargin{2});
      elseif nargin == 3 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric') && isa(varargin{3},'numeric')
        my_ptr = gtsam_wrapper(400, varargin{1}, varargin{2}, varargin{3});
      elseif nargin == 4 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric') && isa(varargin{3},'numeric') && isa(varargin{4},'numeric')
        my_ptr = gtsam_wrapper(401, varargin{1}, varargin{2}, varargin{3}, varargin{4});
      elseif nargin == 5 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric') && isa(varargin{3},'numeric') && isa(varargin{4},'numeric') && isa(varargin{5},'numeric')
        my_ptr = gtsam_wrapper(402, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5});
      elseif nargin == 6 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric') && isa(varargin{3},'numeric') && isa(varargin{4},'numeric') && isa(varargin{5},'numeric') && isa(varargin{6},'numeric')
        my_ptr = gtsam_wrapper(403, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5}, varargin{6});
      else
        error('Arguments do not match any overload of gtsam.IndexFactor constructor');
      end
      obj.ptr_gtsamIndexFactor = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(404, obj.ptr_gtsamIndexFactor);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = equals(this, varargin)
      % EQUALS usage: equals(IndexFactor other, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(IndexFactor other, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.IndexFactor') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(405, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.IndexFactor.equals');
      end
    end

    function varargout = permuteWithInverse(this, varargin)
      % PERMUTEWITHINVERSE usage: permuteWithInverse(Permutation inversePermutation) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % permuteWithInverse(Permutation inversePermutation)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Permutation')
        gtsam_wrapper(406, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.IndexFactor.permuteWithInverse');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(407, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.IndexFactor.print');
      end
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % size()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(408, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.IndexFactor.size');
      end
    end

  end

  methods(Static = true)
  end
end
