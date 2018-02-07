%class Point3, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%Point3()
%Point3(double x, double y, double z)
%Point3(Vector v)
%
%-------Methods-------
%between(Point3 p2) : returns gtsam::Point3
%compose(Point3 p2) : returns gtsam::Point3
%dim() : returns size_t
%equals(Point3 p, double tol) : returns bool
%inverse() : returns gtsam::Point3
%localCoordinates(Point3 p) : returns Vector
%print(string s) : returns void
%retract(Vector v) : returns gtsam::Point3
%vector() : returns Vector
%x() : returns double
%y() : returns double
%z() : returns double
%
%-------Static Methods-------
%Dim() : returns size_t
%Expmap(Vector v) : returns gtsam::Point3
%Logmap(Point3 p) : returns Vector
%identity() : returns gtsam::Point3
%
classdef Point3 < gtsam.Value
  properties
    ptr_gtsamPoint3 = 0
  end
  methods
    function obj = Point3(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(98, varargin{2});
        end
        base_ptr = gtsam_wrapper(97, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_wrapper(99);
      elseif nargin == 3 && isa(varargin{1},'double') && isa(varargin{2},'double') && isa(varargin{3},'double')
        [ my_ptr, base_ptr ] = gtsam_wrapper(100, varargin{1}, varargin{2}, varargin{3});
      elseif nargin == 1 && isa(varargin{1},'double')
        [ my_ptr, base_ptr ] = gtsam_wrapper(101, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.Point3 constructor');
      end
      obj = obj@gtsam.Value(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamPoint3 = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(102, obj.ptr_gtsamPoint3);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = between(this, varargin)
      % BETWEEN usage: between(Point3 p2) : returns gtsam::Point3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % between(Point3 p2)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point3')
        varargout{1} = gtsam_wrapper(103, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Point3.between');
      end
    end

    function varargout = compose(this, varargin)
      % COMPOSE usage: compose(Point3 p2) : returns gtsam::Point3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % compose(Point3 p2)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point3')
        varargout{1} = gtsam_wrapper(104, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Point3.compose');
      end
    end

    function varargout = dim(this, varargin)
      % DIM usage: dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % dim()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(105, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Point3.dim');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(Point3 p, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(Point3 p, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.Point3') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(106, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Point3.equals');
      end
    end

    function varargout = inverse(this, varargin)
      % INVERSE usage: inverse() : returns gtsam::Point3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % inverse()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(107, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Point3.inverse');
      end
    end

    function varargout = localCoordinates(this, varargin)
      % LOCALCOORDINATES usage: localCoordinates(Point3 p) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % localCoordinates(Point3 p)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point3')
        varargout{1} = gtsam_wrapper(108, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Point3.localCoordinates');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(109, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Point3.print');
      end
    end

    function varargout = retract(this, varargin)
      % RETRACT usage: retract(Vector v) : returns gtsam::Point3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % retract(Vector v)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(110, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Point3.retract');
      end
    end

    function varargout = vector(this, varargin)
      % VECTOR usage: vector() : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % vector()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(111, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Point3.vector');
      end
    end

    function varargout = x(this, varargin)
      % X usage: x() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % x()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(112, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Point3.x');
      end
    end

    function varargout = y(this, varargin)
      % Y usage: y() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % y()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(113, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Point3.y');
      end
    end

    function varargout = z(this, varargin)
      % Z usage: z() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % z()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(114, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Point3.z');
      end
    end

  end

  methods(Static = true)
    function varargout = Dim(varargin)
      % DIM usage: Dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % DIM()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(115, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Point3.Dim');
      end
    end

    function varargout = Expmap(varargin)
      % EXPMAP usage: Expmap(Vector v) : returns gtsam::Point3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % EXPMAP(Vector v)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(116, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Point3.Expmap');
      end
    end

    function varargout = Logmap(varargin)
      % LOGMAP usage: Logmap(Point3 p) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % LOGMAP(Point3 p)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point3')
        varargout{1} = gtsam_wrapper(117, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Point3.Logmap');
      end
    end

    function varargout = Identity(varargin)
      % IDENTITY usage: identity() : returns gtsam::Point3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % IDENTITY()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(118, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Point3.Identity');
      end
    end

  end
end
