%class KeySet, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%KeySet()
%KeySet(KeySet other)
%KeySet(KeyVector other)
%KeySet(KeyList other)
%
%-------Methods-------
%clear() : returns void
%count(size_t key) : returns bool
%empty() : returns bool
%equals(KeySet other) : returns bool
%erase(size_t key) : returns bool
%insert(size_t key) : returns void
%print(string s) : returns void
%size() : returns size_t
%
classdef KeySet < handle
  properties
    ptr_gtsamKeySet = 0
  end
  methods
    function obj = KeySet(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(903, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(904);
      elseif nargin == 1 && isa(varargin{1},'gtsam.KeySet')
        my_ptr = gtsam_wrapper(905, varargin{1});
      elseif nargin == 1 && isa(varargin{1},'gtsam.KeyVector')
        my_ptr = gtsam_wrapper(906, varargin{1});
      elseif nargin == 1 && isa(varargin{1},'gtsam.KeyList')
        my_ptr = gtsam_wrapper(907, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.KeySet constructor');
      end
      obj.ptr_gtsamKeySet = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(908, obj.ptr_gtsamKeySet);
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
        gtsam_wrapper(909, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.KeySet.clear');
      end
    end

    function varargout = count(this, varargin)
      % COUNT usage: count(size_t key) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % count(size_t key)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        varargout{1} = gtsam_wrapper(910, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.KeySet.count');
      end
    end

    function varargout = empty(this, varargin)
      % EMPTY usage: empty() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % empty()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(911, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.KeySet.empty');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(KeySet other) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(KeySet other)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.KeySet')
        varargout{1} = gtsam_wrapper(912, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.KeySet.equals');
      end
    end

    function varargout = erase(this, varargin)
      % ERASE usage: erase(size_t key) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % erase(size_t key)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        varargout{1} = gtsam_wrapper(913, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.KeySet.erase');
      end
    end

    function varargout = insert(this, varargin)
      % INSERT usage: insert(size_t key) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % insert(size_t key)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        gtsam_wrapper(914, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.KeySet.insert');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(915, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.KeySet.print');
      end
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % size()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(916, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.KeySet.size');
      end
    end

  end

  methods(Static = true)
  end
end
