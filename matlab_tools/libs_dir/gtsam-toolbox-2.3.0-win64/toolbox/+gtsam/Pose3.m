%class Pose3, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%Pose3()
%Pose3(Pose3 pose)
%Pose3(Rot3 r, Point3 t)
%Pose3(Pose2 pose2)
%Pose3(Matrix t)
%
%-------Methods-------
%Adjoint(Vector xi) : returns Vector
%AdjointMap() : returns Matrix
%between(Pose3 p2) : returns gtsam::Pose3
%compose(Pose3 p2) : returns gtsam::Pose3
%dim() : returns size_t
%equals(Pose3 pose, double tol) : returns bool
%inverse() : returns gtsam::Pose3
%localCoordinates(Pose3 T2) : returns Vector
%matrix() : returns Matrix
%print(string s) : returns void
%range(Point3 point) : returns double
%range(Pose3 pose) : returns double
%retract(Vector v) : returns gtsam::Pose3
%retractFirstOrder(Vector v) : returns gtsam::Pose3
%rotation() : returns gtsam::Rot3
%transform_from(Point3 p) : returns gtsam::Point3
%transform_to(Point3 p) : returns gtsam::Point3
%transform_to(Pose3 pose) : returns gtsam::Point3
%translation() : returns gtsam::Point3
%x() : returns double
%y() : returns double
%z() : returns double
%
%-------Static Methods-------
%Dim() : returns size_t
%Expmap(Vector v) : returns gtsam::Pose3
%Logmap(Pose3 p) : returns Vector
%identity() : returns gtsam::Pose3
%wedge(double wx, double wy, double wz, double vx, double vy, double vz) : returns Matrix
%
classdef Pose3 < gtsam.Value
  properties
    ptr_gtsamPose3 = 0
  end
  methods
    function obj = Pose3(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(223, varargin{2});
        end
        base_ptr = gtsam_wrapper(222, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_wrapper(224);
      elseif nargin == 1 && isa(varargin{1},'gtsam.Pose3')
        [ my_ptr, base_ptr ] = gtsam_wrapper(225, varargin{1});
      elseif nargin == 2 && isa(varargin{1},'gtsam.Rot3') && isa(varargin{2},'gtsam.Point3')
        [ my_ptr, base_ptr ] = gtsam_wrapper(226, varargin{1}, varargin{2});
      elseif nargin == 1 && isa(varargin{1},'gtsam.Pose2')
        [ my_ptr, base_ptr ] = gtsam_wrapper(227, varargin{1});
      elseif nargin == 1 && isa(varargin{1},'double')
        [ my_ptr, base_ptr ] = gtsam_wrapper(228, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.Pose3 constructor');
      end
      obj = obj@gtsam.Value(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamPose3 = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(229, obj.ptr_gtsamPose3);
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
        varargout{1} = gtsam_wrapper(230, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose3.Adjoint');
      end
    end

    function varargout = AdjointMap(this, varargin)
      % ADJOINTMAP usage: AdjointMap() : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % AdjointMap()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(231, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose3.AdjointMap');
      end
    end

    function varargout = between(this, varargin)
      % BETWEEN usage: between(Pose3 p2) : returns gtsam::Pose3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % between(Pose3 p2)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Pose3')
        varargout{1} = gtsam_wrapper(232, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose3.between');
      end
    end

    function varargout = compose(this, varargin)
      % COMPOSE usage: compose(Pose3 p2) : returns gtsam::Pose3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % compose(Pose3 p2)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Pose3')
        varargout{1} = gtsam_wrapper(233, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose3.compose');
      end
    end

    function varargout = dim(this, varargin)
      % DIM usage: dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % dim()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(234, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose3.dim');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(Pose3 pose, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(Pose3 pose, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.Pose3') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(235, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose3.equals');
      end
    end

    function varargout = inverse(this, varargin)
      % INVERSE usage: inverse() : returns gtsam::Pose3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % inverse()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(236, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose3.inverse');
      end
    end

    function varargout = localCoordinates(this, varargin)
      % LOCALCOORDINATES usage: localCoordinates(Pose3 T2) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % localCoordinates(Pose3 T2)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Pose3')
        varargout{1} = gtsam_wrapper(237, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose3.localCoordinates');
      end
    end

    function varargout = matrix(this, varargin)
      % MATRIX usage: matrix() : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % matrix()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(238, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose3.matrix');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(239, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose3.print');
      end
    end

    function varargout = range(this, varargin)
      % RANGE usage: range(Point3 point),  range(Pose3 pose) : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % range(Point3 point)
      % range(Pose3 pose)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point3')
        varargout{1} = gtsam_wrapper(240, this, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'gtsam.Pose3')
        varargout{1} = gtsam_wrapper(241, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose3.range');
      end
    end

    function varargout = retract(this, varargin)
      % RETRACT usage: retract(Vector v) : returns gtsam::Pose3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % retract(Vector v)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(242, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose3.retract');
      end
    end

    function varargout = retractFirstOrder(this, varargin)
      % RETRACTFIRSTORDER usage: retractFirstOrder(Vector v) : returns gtsam::Pose3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % retractFirstOrder(Vector v)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(243, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose3.retractFirstOrder');
      end
    end

    function varargout = rotation(this, varargin)
      % ROTATION usage: rotation() : returns gtsam::Rot3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % rotation()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(244, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose3.rotation');
      end
    end

    function varargout = transform_from(this, varargin)
      % TRANSFORM_FROM usage: transform_from(Point3 p) : returns gtsam::Point3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % transform_from(Point3 p)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point3')
        varargout{1} = gtsam_wrapper(245, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose3.transform_from');
      end
    end

    function varargout = transform_to(this, varargin)
      % TRANSFORM_TO usage: transform_to(Point3 p),  transform_to(Pose3 pose) : returns gtsam::Point3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % transform_to(Point3 p)
      % transform_to(Pose3 pose)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point3')
        varargout{1} = gtsam_wrapper(246, this, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'gtsam.Pose3')
        varargout{1} = gtsam_wrapper(247, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose3.transform_to');
      end
    end

    function varargout = translation(this, varargin)
      % TRANSLATION usage: translation() : returns gtsam::Point3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % translation()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(248, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose3.translation');
      end
    end

    function varargout = x(this, varargin)
      % X usage: x() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % x()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(249, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose3.x');
      end
    end

    function varargout = y(this, varargin)
      % Y usage: y() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % y()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(250, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose3.y');
      end
    end

    function varargout = z(this, varargin)
      % Z usage: z() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % z()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(251, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose3.z');
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
        varargout{1} = gtsam_wrapper(252, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose3.Dim');
      end
    end

    function varargout = Expmap(varargin)
      % EXPMAP usage: Expmap(Vector v) : returns gtsam::Pose3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % EXPMAP(Vector v)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(253, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose3.Expmap');
      end
    end

    function varargout = Logmap(varargin)
      % LOGMAP usage: Logmap(Pose3 p) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % LOGMAP(Pose3 p)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Pose3')
        varargout{1} = gtsam_wrapper(254, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose3.Logmap');
      end
    end

    function varargout = Identity(varargin)
      % IDENTITY usage: identity() : returns gtsam::Pose3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % IDENTITY()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(255, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose3.Identity');
      end
    end

    function varargout = Wedge(varargin)
      % WEDGE usage: wedge(double wx, double wy, double wz, double vx, double vy, double vz) : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % WEDGE(double wx, double wy, double wz, double vx, double vy, double vz)
      if length(varargin) == 6 && isa(varargin{1},'double') && isa(varargin{2},'double') && isa(varargin{3},'double') && isa(varargin{4},'double') && isa(varargin{5},'double') && isa(varargin{6},'double')
        varargout{1} = gtsam_wrapper(256, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose3.Wedge');
      end
    end

  end
end
