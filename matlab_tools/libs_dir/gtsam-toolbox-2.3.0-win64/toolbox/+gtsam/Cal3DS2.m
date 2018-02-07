%class Cal3DS2, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%Cal3DS2()
%Cal3DS2(double fx, double fy, double s, double u0, double v0, double k1, double k2, double k3, double k4)
%Cal3DS2(Vector v)
%
%-------Methods-------
%calibrate(Point2 p, double tol) : returns gtsam::Point2
%calibrate(Point2 p) : returns gtsam::Point2
%dim() : returns size_t
%equals(Cal3DS2 rhs, double tol) : returns bool
%fx() : returns double
%fy() : returns double
%k() : returns Vector
%localCoordinates(Cal3DS2 c) : returns Vector
%print(string s) : returns void
%px() : returns double
%py() : returns double
%retract(Vector v) : returns gtsam::Cal3DS2
%skew() : returns double
%uncalibrate(Point2 p) : returns gtsam::Point2
%vector() : returns Vector
%
%-------Static Methods-------
%Dim() : returns size_t
%
classdef Cal3DS2 < gtsam.Value
  properties
    ptr_gtsamCal3DS2 = 0
  end
  methods
    function obj = Cal3DS2(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(282, varargin{2});
        end
        base_ptr = gtsam_wrapper(281, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_wrapper(283);
      elseif nargin == 9 && isa(varargin{1},'double') && isa(varargin{2},'double') && isa(varargin{3},'double') && isa(varargin{4},'double') && isa(varargin{5},'double') && isa(varargin{6},'double') && isa(varargin{7},'double') && isa(varargin{8},'double') && isa(varargin{9},'double')
        [ my_ptr, base_ptr ] = gtsam_wrapper(284, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5}, varargin{6}, varargin{7}, varargin{8}, varargin{9});
      elseif nargin == 1 && isa(varargin{1},'double')
        [ my_ptr, base_ptr ] = gtsam_wrapper(285, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.Cal3DS2 constructor');
      end
      obj = obj@gtsam.Value(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamCal3DS2 = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(286, obj.ptr_gtsamCal3DS2);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = calibrate(this, varargin)
      % CALIBRATE usage: calibrate(Point2 p, double tol),  calibrate(Point2 p) : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % calibrate(Point2 p, double tol)
      % calibrate(Point2 p)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.Point2') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(287, this, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'gtsam.Point2')
        varargout{1} = gtsam_wrapper(288, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Cal3DS2.calibrate');
      end
    end

    function varargout = dim(this, varargin)
      % DIM usage: dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % dim()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(289, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Cal3DS2.dim');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(Cal3DS2 rhs, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(Cal3DS2 rhs, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.Cal3DS2') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(290, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Cal3DS2.equals');
      end
    end

    function varargout = fx(this, varargin)
      % FX usage: fx() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % fx()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(291, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Cal3DS2.fx');
      end
    end

    function varargout = fy(this, varargin)
      % FY usage: fy() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % fy()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(292, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Cal3DS2.fy');
      end
    end

    function varargout = k(this, varargin)
      % K usage: k() : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % k()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(293, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Cal3DS2.k');
      end
    end

    function varargout = localCoordinates(this, varargin)
      % LOCALCOORDINATES usage: localCoordinates(Cal3DS2 c) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % localCoordinates(Cal3DS2 c)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Cal3DS2')
        varargout{1} = gtsam_wrapper(294, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Cal3DS2.localCoordinates');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(295, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Cal3DS2.print');
      end
    end

    function varargout = px(this, varargin)
      % PX usage: px() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % px()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(296, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Cal3DS2.px');
      end
    end

    function varargout = py(this, varargin)
      % PY usage: py() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % py()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(297, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Cal3DS2.py');
      end
    end

    function varargout = retract(this, varargin)
      % RETRACT usage: retract(Vector v) : returns gtsam::Cal3DS2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % retract(Vector v)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(298, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Cal3DS2.retract');
      end
    end

    function varargout = skew(this, varargin)
      % SKEW usage: skew() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % skew()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(299, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Cal3DS2.skew');
      end
    end

    function varargout = uncalibrate(this, varargin)
      % UNCALIBRATE usage: uncalibrate(Point2 p) : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % uncalibrate(Point2 p)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point2')
        varargout{1} = gtsam_wrapper(300, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Cal3DS2.uncalibrate');
      end
    end

    function varargout = vector(this, varargin)
      % VECTOR usage: vector() : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % vector()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(301, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Cal3DS2.vector');
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
        varargout{1} = gtsam_wrapper(302, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Cal3DS2.Dim');
      end
    end

  end
end
