%class Marginals, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%Marginals(NonlinearFactorGraph graph, Values solution)
%
%-------Methods-------
%jointMarginalCovariance(KeyVector variables) : returns gtsam::JointMarginal
%jointMarginalInformation(KeyVector variables) : returns gtsam::JointMarginal
%marginalCovariance(size_t variable) : returns Matrix
%marginalInformation(size_t variable) : returns Matrix
%print(string s) : returns void
%
classdef Marginals < handle
  properties
    ptr_gtsamMarginals = 0
  end
  methods
    function obj = Marginals(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(930, my_ptr);
      elseif nargin == 2 && isa(varargin{1},'gtsam.NonlinearFactorGraph') && isa(varargin{2},'gtsam.Values')
        my_ptr = gtsam_wrapper(931, varargin{1}, varargin{2});
      else
        error('Arguments do not match any overload of gtsam.Marginals constructor');
      end
      obj.ptr_gtsamMarginals = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(932, obj.ptr_gtsamMarginals);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = jointMarginalCovariance(this, varargin)
      % JOINTMARGINALCOVARIANCE usage: jointMarginalCovariance(KeyVector variables) : returns gtsam::JointMarginal
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % jointMarginalCovariance(KeyVector variables)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.KeyVector')
        varargout{1} = gtsam_wrapper(933, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Marginals.jointMarginalCovariance');
      end
    end

    function varargout = jointMarginalInformation(this, varargin)
      % JOINTMARGINALINFORMATION usage: jointMarginalInformation(KeyVector variables) : returns gtsam::JointMarginal
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % jointMarginalInformation(KeyVector variables)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.KeyVector')
        varargout{1} = gtsam_wrapper(934, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Marginals.jointMarginalInformation');
      end
    end

    function varargout = marginalCovariance(this, varargin)
      % MARGINALCOVARIANCE usage: marginalCovariance(size_t variable) : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % marginalCovariance(size_t variable)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        varargout{1} = gtsam_wrapper(935, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Marginals.marginalCovariance');
      end
    end

    function varargout = marginalInformation(this, varargin)
      % MARGINALINFORMATION usage: marginalInformation(size_t variable) : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % marginalInformation(size_t variable)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        varargout{1} = gtsam_wrapper(936, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Marginals.marginalInformation');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(937, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Marginals.print');
      end
    end

  end

  methods(Static = true)
  end
end
