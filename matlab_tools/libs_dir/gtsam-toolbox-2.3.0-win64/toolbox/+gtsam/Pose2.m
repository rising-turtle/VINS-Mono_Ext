%class Pose2, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%Pose2()
%Pose2(double x, double y, double theta)
%Pose2(double theta, Point2 t)
%Pose2(Rot2 r, Point2 t)
%Pose2(Vector v)
%
%-------Methods-------
%Adjoint(Vector xi) : returns Vector
%AdjointMap() : returns Matrix
%bearing(Point2 point) : returns gtsam::Rot2
%between(Pose2 p2) : returns gtsam::Pose2
%compose(Pose2 p2) : returns gtsam::Pose2
%dim() : returns size_t
%equals(Pose2 pose, double tol) : returns bool
%inverse() : returns gtsam::Pose2
%localCoordinates(Pose2 p) : returns Vector
%matrix() : returns Matrix
%print(string s) : returns void
%range(Point2 point) : returns double
%retract(Vector v) : returns gtsam::Pose2
%rotation() : returns gtsam::Rot2
%theta() : returns double
%transform_from(Point2 p) : returns gtsam::Point2
%transform_to(Point2 p) : returns gtsam::Point2
%translation() : returns gtsam::Point2
%x() : returns double
%y() : returns double
%
%-------Static Methods-------
%Dim() : returns size_t
%Expmap(Vector v) : returns gtsam::Pose2
%Logmap(Pose2 p) : returns Vector
%identity() : returns gtsam::Pose2
%wedge(double vx, double vy, double w) : returns Matrix
%
classdef Pose2 < gtsam.Value
  properties
    ptr_gtsamPose2 = 0
  end
  methods
    function obj = Pose2(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(190, varargin{2});
        end
        base_ptr = gtsam_wrapper(189, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_wrapper(191);
      elseif nargin == 3 && isa(varargin{1},'double') && isa(varargin{2},'double') && isa(varargin{3},'double')
        [ my_ptr, base_ptr ] = gtsam_wrapper(192, varargin{1}, varargin{2}, varargin{3});
      elseif nargin == 2 && isa(varargin{1},'double') && isa(varargin{2},'gtsam.Point2')
        [ my_ptr, base_ptr ] = gtsam_wrapper(193, varargin{1}, varargin{2});
      elseif nargin == 2 && isa(varargin{1},'gtsam.Rot2') && isa(varargin{2},'gtsam.Point2')
        [ my_ptr, base_ptr ] = gtsam_wrapper(194, varargin{1}, varargin{2});
      elseif nargin == 1 && isa(varargin{1},'double')
        [ my_ptr, base_ptr ] = gtsam_wrapper(195, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.Pose2 constructor');
      end
      obj = obj@gtsam.Value(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamPose2 = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(196, obj.ptr_gtsamPose2);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = Adjoint(this, varargin)
      % ADJOINT usage: Adjoint(Vector xi) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % Adjoint(Vector xi)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(197, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose2.Adjoint');
      end
    end

    function varargout = AdjointMap(this, varargin)
      % ADJOINTMAP usage: AdjointMap() : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % AdjointMap()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(198, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose2.AdjointMap');
      end
    end

    function varargout = bearing(this, varargin)
      % BEARING usage: bearing(Point2 point) : returns gtsam::Rot2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % bearing(Point2 point)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point2')
        varargout{1} = gtsam_wrapper(199, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose2.bearing');
      end
    end

    function varargout = between(this, varargin)
      % BETWEEN usage: between(Pose2 p2) : returns gtsam::Pose2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % between(Pose2 p2)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Pose2')
        varargout{1} = gtsam_wrapper(200, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose2.between');
      end
    end

    function varargout = compose(this, varargin)
      % COMPOSE usage: compose(Pose2 p2) : returns gtsam::Pose2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % compose(Pose2 p2)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Pose2')
        varargout{1} = gtsam_wrapper(201, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose2.compose');
      end
    end

    function varargout = dim(this, varargin)
      % DIM usage: dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % dim()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(202, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose2.dim');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(Pose2 pose, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(Pose2 pose, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.Pose2') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(203, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose2.equals');
      end
    end

    function varargout = inverse(this, varargin)
      % INVERSE usage: inverse() : returns gtsam::Pose2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % inverse()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(204, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose2.inverse');
      end
    end

    function varargout = localCoordinates(this, varargin)
      % LOCALCOORDINATES usage: localCoordinates(Pose2 p) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % localCoordinates(Pose2 p)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Pose2')
        varargout{1} = gtsam_wrapper(205, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose2.localCoordinates');
      end
    end

    function varargout = matrix(this, varargin)
      % MATRIX usage: matrix() : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % matrix()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(206, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose2.matrix');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(207, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose2.print');
      end
    end

    function varargout = range(this, varargin)
      % RANGE usage: range(Point2 point) : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % range(Point2 point)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point2')
        varargout{1} = gtsam_wrapper(208, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose2.range');
      end
    end

    function varargout = retract(this, varargin)
      % RETRACT usage: retract(Vector v) : returns gtsam::Pose2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % retract(Vector v)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(209, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose2.retract');
      end
    end

    function varargout = rotation(this, varargin)
      % ROTATION usage: rotation() : returns gtsam::Rot2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % rotation()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(210, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose2.rotation');
      end
    end

    function varargout = theta(this, varargin)
      % THETA usage: theta() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % theta()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(211, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose2.theta');
      end
    end

    function varargout = transform_from(this, varargin)
      % TRANSFORM_FROM usage: transform_from(Point2 p) : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % transform_from(Point2 p)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point2')
        varargout{1} = gtsam_wrapper(212, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose2.transform_from');
      end
    end

    function varargout = transform_to(this, varargin)
      % TRANSFORM_TO usage: transform_to(Point2 p) : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % transform_to(Point2 p)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point2')
        varargout{1} = gtsam_wrapper(213, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose2.transform_to');
      end
    end

    function varargout = translation(this, varargin)
      % TRANSLATION usage: translation() : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % translation()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(214, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose2.translation');
      end
    end

    function varargout = x(this, varargin)
      % X usage: x() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % x()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(215, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose2.x');
      end
    end

    function varargout = y(this, varargin)
      % Y usage: y() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % y()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(216, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose2.y');
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
        varargout{1} = gtsam_wrapper(217, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose2.Dim');
      end
    end

    function varargout = Expmap(varargin)
      % EXPMAP usage: Expmap(Vector v) : returns gtsam::Pose2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % EXPMAP(Vector v)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(218, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose2.Expmap');
      end
    end

    function varargout = Logmap(varargin)
      % LOGMAP usage: Logmap(Pose2 p) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % LOGMAP(Pose2 p)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Pose2')
        varargout{1} = gtsam_wrapper(219, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose2.Logmap');
      end
    end

    function varargout = Identity(varargin)
      % IDENTITY usage: identity() : returns gtsam::Pose2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % IDENTITY()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(220, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose2.Identity');
      end
    end

    function varargout = Wedge(varargin)
      % WEDGE usage: wedge(double vx, double vy, double w) : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % WEDGE(double vx, double vy, double w)
      if length(varargin) == 3 && isa(varargin{1},'double') && isa(varargin{2},'double') && isa(varargin{3},'double')
        varargout{1} = gtsam_wrapper(221, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose2.Wedge');
      end
    end

  end
end
