%class Ordering, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%Ordering()
%
%-------Methods-------
%at(size_t key) : returns size_t
%equals(Ordering ord, double tol) : returns bool
%exists(size_t key) : returns bool
%insert(size_t key, size_t order) : returns void
%key(size_t index) : returns size_t
%permuteInPlace(Permutation permutation) : returns void
%permuteInPlace(Permutation selector, Permutation permutation) : returns void
%print(string s) : returns void
%push_back(size_t key) : returns void
%size() : returns size_t
%
classdef Ordering < handle
  properties
    ptr_gtsamOrdering = 0
  end
  methods
    function obj = Ordering(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(819, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(820);
      else
        error('Arguments do not match any overload of gtsam.Ordering constructor');
      end
      obj.ptr_gtsamOrdering = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(821, obj.ptr_gtsamOrdering);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = at(this, varargin)
      % AT usage: at(size_t key) : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % at(size_t key)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        varargout{1} = gtsam_wrapper(822, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Ordering.at');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(Ordering ord, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(Ordering ord, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.Ordering') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(823, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Ordering.equals');
      end
    end

    function varargout = exists(this, varargin)
      % EXISTS usage: exists(size_t key) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % exists(size_t key)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        varargout{1} = gtsam_wrapper(824, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Ordering.exists');
      end
    end

    function varargout = insert(this, varargin)
      % INSERT usage: insert(size_t key, size_t order) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % insert(size_t key, size_t order)
      if length(varargin) == 2 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric')
        gtsam_wrapper(825, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Ordering.insert');
      end
    end

    function varargout = key(this, varargin)
      % KEY usage: key(size_t index) : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % key(size_t index)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        varargout{1} = gtsam_wrapper(826, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Ordering.key');
      end
    end

    function varargout = permuteInPlace(this, varargin)
      % PERMUTEINPLACE usage: permuteInPlace(Permutation permutation),  permuteInPlace(Permutation selector, Permutation permutation) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % permuteInPlace(Permutation permutation)
      % permuteInPlace(Permutation selector, Permutation permutation)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Permutation')
        gtsam_wrapper(827, this, varargin{:});
      elseif length(varargin) == 2 && isa(varargin{1},'gtsam.Permutation') && isa(varargin{2},'gtsam.Permutation')
        gtsam_wrapper(828, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Ordering.permuteInPlace');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(829, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Ordering.print');
      end
    end

    function varargout = push_back(this, varargin)
      % PUSH_BACK usage: push_back(size_t key) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % push_back(size_t key)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        gtsam_wrapper(830, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Ordering.push_back');
      end
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % size()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(831, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Ordering.size');
      end
    end

  end

  methods(Static = true)
  end
end
