%class KeyVector, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%KeyVector()
%KeyVector(KeyVector other)
%KeyVector(KeySet other)
%KeyVector(KeyList other)
%
%-------Methods-------
%at(size_t i) : returns size_t
%back() : returns size_t
%clear() : returns void
%empty() : returns bool
%front() : returns size_t
%push_back(size_t key) : returns void
%size() : returns size_t
%
classdef KeyVector < handle
  properties
    ptr_gtsamKeyVector = 0
  end
  methods
    function obj = KeyVector(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(917, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(918);
      elseif nargin == 1 && isa(varargin{1},'gtsam.KeyVector')
        my_ptr = gtsam_wrapper(919, varargin{1});
      elseif nargin == 1 && isa(varargin{1},'gtsam.KeySet')
        my_ptr = gtsam_wrapper(920, varargin{1});
      elseif nargin == 1 && isa(varargin{1},'gtsam.KeyList')
        my_ptr = gtsam_wrapper(921, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.KeyVector constructor');
      end
      obj.ptr_gtsamKeyVector = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(922, obj.ptr_gtsamKeyVector);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = at(this, varargin)
      % AT usage: at(size_t i) : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % at(size_t i)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        varargout{1} = gtsam_wrapper(923, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.KeyVector.at');
      end
    end

    function varargout = back(this, varargin)
      % BACK usage: back() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % back()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(924, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.KeyVector.back');
      end
    end

    function varargout = clear(this, varargin)
      % CLEAR usage: clear() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % clear()
      if length(varargin) == 0
        gtsam_wrapper(925, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.KeyVector.clear');
      end
    end

    function varargout = empty(this, varargin)
      % EMPTY usage: empty() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % empty()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(926, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.KeyVector.empty');
      end
    end

    function varargout = front(this, varargin)
      % FRONT usage: front() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % front()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(927, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.KeyVector.front');
      end
    end

    function varargout = push_back(this, varargin)
      % PUSH_BACK usage: push_back(size_t key) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % push_back(size_t key)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        gtsam_wrapper(928, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.KeyVector.push_back');
      end
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % size()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(929, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.KeyVector.size');
      end
    end

  end

  methods(Static = true)
  end
end
