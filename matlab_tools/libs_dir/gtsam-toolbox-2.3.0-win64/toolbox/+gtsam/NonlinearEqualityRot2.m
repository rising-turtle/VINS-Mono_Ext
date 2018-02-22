%class NonlinearEqualityRot2, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%NonlinearEqualityRot2(size_t j, Rot2 feasible)
%NonlinearEqualityRot2(size_t j, Rot2 feasible, double error_gain)
%
%-------Methods-------
%active(Values c) : returns bool
%clone() : returns gtsam::NonlinearFactor
%dim() : returns size_t
%equals(NonlinearFactor other, double tol) : returns void
%error(Values c) : returns double
%keys() : returns gtsam::KeyVector
%linearize(Values c, Ordering ordering) : returns gtsam::GaussianFactor
%print(string s) : returns void
%printKeys(string s) : returns void
%size() : returns size_t
%
classdef NonlinearEqualityRot2 < gtsam.NonlinearFactor
  properties
    ptr_gtsamNonlinearEqualityRot2 = 0
  end
  methods
    function obj = NonlinearEqualityRot2(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(1616, varargin{2});
        end
        base_ptr = gtsam_wrapper(1615, my_ptr);
      elseif nargin == 2 && isa(varargin{1},'numeric') && isa(varargin{2},'gtsam.Rot2')
        [ my_ptr, base_ptr ] = gtsam_wrapper(1617, varargin{1}, varargin{2});
      elseif nargin == 3 && isa(varargin{1},'numeric') && isa(varargin{2},'gtsam.Rot2') && isa(varargin{3},'double')
        [ my_ptr, base_ptr ] = gtsam_wrapper(1618, varargin{1}, varargin{2}, varargin{3});
      else
        error('Arguments do not match any overload of gtsam.NonlinearEqualityRot2 constructor');
      end
      obj = obj@gtsam.NonlinearFactor(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamNonlinearEqualityRot2 = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(1619, obj.ptr_gtsamNonlinearEqualityRot2);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = active(this, varargin)
      % ACTIVE usage: active(Values c) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % active(Values c)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Values')
        varargout{1} = gtsam_wrapper(1620, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearEqualityRot2.active');
      end
    end

    function varargout = clone(this, varargin)
      % CLONE usage: clone() : returns gtsam::NonlinearFactor
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % clone()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1621, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearEqualityRot2.clone');
      end
    end

    function varargout = dim(this, varargin)
      % DIM usage: dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % dim()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1622, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearEqualityRot2.dim');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(NonlinearFactor other, double tol) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(NonlinearFactor other, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.NonlinearFactor') && isa(varargin{2},'double')
        gtsam_wrapper(1623, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearEqualityRot2.equals');
      end
    end

    function varargout = error(this, varargin)
      % ERROR usage: error(Values c) : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % error(Values c)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Values')
        varargout{1} = gtsam_wrapper(1624, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearEqualityRot2.error');
      end
    end

    function varargout = keys(this, varargin)
      % KEYS usage: keys() : returns gtsam::KeyVector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % keys()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1625, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearEqualityRot2.keys');
      end
    end

    function varargout = linearize(this, varargin)
      % LINEARIZE usage: linearize(Values c, Ordering ordering) : returns gtsam::GaussianFactor
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % linearize(Values c, Ordering ordering)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.Values') && isa(varargin{2},'gtsam.Ordering')
        varargout{1} = gtsam_wrapper(1626, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearEqualityRot2.linearize');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1627, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearEqualityRot2.print');
      end
    end

    function varargout = printKeys(this, varargin)
      % PRINTKEYS usage: printKeys(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % printKeys(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1628, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearEqualityRot2.printKeys');
      end
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % size()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1629, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearEqualityRot2.size');
      end
    end

  end

  methods(Static = true)
  end
end
