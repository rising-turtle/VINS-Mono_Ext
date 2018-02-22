%class Rot3, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%Rot3()
%Rot3(Matrix R)
%
%-------Methods-------
%between(Rot3 p2) : returns gtsam::Rot3
%column(size_t index) : returns gtsam::Point3
%compose(Rot3 p2) : returns gtsam::Rot3
%dim() : returns size_t
%equals(Rot3 rot, double tol) : returns bool
%inverse() : returns gtsam::Rot3
%localCoordinates(Rot3 p) : returns Vector
%matrix() : returns Matrix
%pitch() : returns double
%print(string s) : returns void
%quaternion() : returns Vector
%retract(Vector v) : returns gtsam::Rot3
%retractCayley(Vector v) : returns gtsam::Rot3
%roll() : returns double
%rotate(Point3 p) : returns gtsam::Point3
%rpy() : returns Vector
%transpose() : returns Matrix
%unrotate(Point3 p) : returns gtsam::Point3
%xyz() : returns Vector
%yaw() : returns double
%ypr() : returns Vector
%
%-------Static Methods-------
%Dim() : returns size_t
%Expmap(Vector v) : returns gtsam::Rot3
%Logmap(Rot3 p) : returns Vector
%Rx(double t) : returns gtsam::Rot3
%Ry(double t) : returns gtsam::Rot3
%Rz(double t) : returns gtsam::Rot3
%RzRyRx(double x, double y, double z) : returns gtsam::Rot3
%RzRyRx(Vector xyz) : returns gtsam::Rot3
%identity() : returns gtsam::Rot3
%pitch(double t) : returns gtsam::Rot3
%quaternion(double w, double x, double y, double z) : returns gtsam::Rot3
%rodriguez(Vector v) : returns gtsam::Rot3
%roll(double t) : returns gtsam::Rot3
%yaw(double t) : returns gtsam::Rot3
%ypr(double y, double p, double r) : returns gtsam::Rot3
%
classdef Rot3 < gtsam.Value
  properties
    ptr_gtsamRot3 = 0
  end
  methods
    function obj = Rot3(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(149, varargin{2});
        end
        base_ptr = gtsam_wrapper(148, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_wrapper(150);
      elseif nargin == 1 && isa(varargin{1},'double')
        [ my_ptr, base_ptr ] = gtsam_wrapper(151, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.Rot3 constructor');
      end
      obj = obj@gtsam.Value(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamRot3 = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(152, obj.ptr_gtsamRot3);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = between(this, varargin)
      % BETWEEN usage: between(Rot3 p2) : returns gtsam::Rot3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % between(Rot3 p2)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Rot3')
        varargout{1} = gtsam_wrapper(153, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot3.between');
      end
    end

    function varargout = column(this, varargin)
      % COLUMN usage: column(size_t index) : returns gtsam::Point3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % column(size_t index)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        varargout{1} = gtsam_wrapper(154, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot3.column');
      end
    end

    function varargout = compose(this, varargin)
      % COMPOSE usage: compose(Rot3 p2) : returns gtsam::Rot3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % compose(Rot3 p2)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Rot3')
        varargout{1} = gtsam_wrapper(155, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot3.compose');
      end
    end

    function varargout = dim(this, varargin)
      % DIM usage: dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % dim()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(156, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot3.dim');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(Rot3 rot, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(Rot3 rot, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.Rot3') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(157, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot3.equals');
      end
    end

    function varargout = inverse(this, varargin)
      % INVERSE usage: inverse() : returns gtsam::Rot3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % inverse()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(158, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot3.inverse');
      end
    end

    function varargout = localCoordinates(this, varargin)
      % LOCALCOORDINATES usage: localCoordinates(Rot3 p) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % localCoordinates(Rot3 p)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Rot3')
        varargout{1} = gtsam_wrapper(159, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot3.localCoordinates');
      end
    end

    function varargout = matrix(this, varargin)
      % MATRIX usage: matrix() : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % matrix()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(160, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot3.matrix');
      end
    end

    function varargout = pitch(this, varargin)
      % PITCH usage: pitch() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % pitch()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(161, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot3.pitch');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(162, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot3.print');
      end
    end

    function varargout = quaternion(this, varargin)
      % QUATERNION usage: quaternion() : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % quaternion()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(163, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot3.quaternion');
      end
    end

    function varargout = retract(this, varargin)
      % RETRACT usage: retract(Vector v) : returns gtsam::Rot3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % retract(Vector v)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(164, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot3.retract');
      end
    end

    function varargout = retractCayley(this, varargin)
      % RETRACTCAYLEY usage: retractCayley(Vector v) : returns gtsam::Rot3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % retractCayley(Vector v)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(165, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot3.retractCayley');
      end
    end

    function varargout = roll(this, varargin)
      % ROLL usage: roll() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % roll()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(166, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot3.roll');
      end
    end

    function varargout = rotate(this, varargin)
      % ROTATE usage: rotate(Point3 p) : returns gtsam::Point3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % rotate(Point3 p)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point3')
        varargout{1} = gtsam_wrapper(167, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot3.rotate');
      end
    end

    function varargout = rpy(this, varargin)
      % RPY usage: rpy() : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % rpy()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(168, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot3.rpy');
      end
    end

    function varargout = transpose(this, varargin)
      % TRANSPOSE usage: transpose() : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % transpose()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(169, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot3.transpose');
      end
    end

    function varargout = unrotate(this, varargin)
      % UNROTATE usage: unrotate(Point3 p) : returns gtsam::Point3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % unrotate(Point3 p)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point3')
        varargout{1} = gtsam_wrapper(170, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot3.unrotate');
      end
    end

    function varargout = xyz(this, varargin)
      % XYZ usage: xyz() : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % xyz()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(171, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot3.xyz');
      end
    end

    function varargout = yaw(this, varargin)
      % YAW usage: yaw() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % yaw()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(172, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot3.yaw');
      end
    end

    function varargout = ypr(this, varargin)
      % YPR usage: ypr() : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % ypr()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(173, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot3.ypr');
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
        varargout{1} = gtsam_wrapper(174, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot3.Dim');
      end
    end

    function varargout = Expmap(varargin)
      % EXPMAP usage: Expmap(Vector v) : returns gtsam::Rot3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % EXPMAP(Vector v)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(175, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot3.Expmap');
      end
    end

    function varargout = Logmap(varargin)
      % LOGMAP usage: Logmap(Rot3 p) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % LOGMAP(Rot3 p)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Rot3')
        varargout{1} = gtsam_wrapper(176, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot3.Logmap');
      end
    end

    function varargout = Rx(varargin)
      % RX usage: Rx(double t) : returns gtsam::Rot3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % RX(double t)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(177, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot3.Rx');
      end
    end

    function varargout = Ry(varargin)
      % RY usage: Ry(double t) : returns gtsam::Rot3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % RY(double t)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(178, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot3.Ry');
      end
    end

    function varargout = Rz(varargin)
      % RZ usage: Rz(double t) : returns gtsam::Rot3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % RZ(double t)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(179, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot3.Rz');
      end
    end

    function varargout = RzRyRx(varargin)
      % RZRYRX usage: RzRyRx(double x, double y, double z),  RzRyRx(Vector xyz) : returns gtsam::Rot3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % RZRYRX(double x, double y, double z)
      % RZRYRX(Vector xyz)
      if length(varargin) == 3 && isa(varargin{1},'double') && isa(varargin{2},'double') && isa(varargin{3},'double')
        varargout{1} = gtsam_wrapper(180, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(181, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot3.RzRyRx');
      end
    end

    function varargout = Identity(varargin)
      % IDENTITY usage: identity() : returns gtsam::Rot3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % IDENTITY()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(182, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot3.Identity');
      end
    end

    function varargout = Pitch(varargin)
      % PITCH usage: pitch(double t) : returns gtsam::Rot3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % PITCH(double t)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(183, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot3.Pitch');
      end
    end

    function varargout = Quaternion(varargin)
      % QUATERNION usage: quaternion(double w, double x, double y, double z) : returns gtsam::Rot3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % QUATERNION(double w, double x, double y, double z)
      if length(varargin) == 4 && isa(varargin{1},'double') && isa(varargin{2},'double') && isa(varargin{3},'double') && isa(varargin{4},'double')
        varargout{1} = gtsam_wrapper(184, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot3.Quaternion');
      end
    end

    function varargout = Rodriguez(varargin)
      % RODRIGUEZ usage: rodriguez(Vector v) : returns gtsam::Rot3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % RODRIGUEZ(Vector v)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(185, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot3.Rodriguez');
      end
    end

    function varargout = Roll(varargin)
      % ROLL usage: roll(double t) : returns gtsam::Rot3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % ROLL(double t)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(186, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot3.Roll');
      end
    end

    function varargout = Yaw(varargin)
      % YAW usage: yaw(double t) : returns gtsam::Rot3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % YAW(double t)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(187, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot3.Yaw');
      end
    end

    function varargout = Ypr(varargin)
      % YPR usage: ypr(double y, double p, double r) : returns gtsam::Rot3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % YPR(double y, double p, double r)
      if length(varargin) == 3 && isa(varargin{1},'double') && isa(varargin{2},'double') && isa(varargin{3},'double')
        varargout{1} = gtsam_wrapper(188, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot3.Ypr');
      end
    end

  end
end
