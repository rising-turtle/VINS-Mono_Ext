%class LinearContainerFactor, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%LinearContainerFactor(GaussianFactor factor, Ordering ordering, Values linearizationPoint)
%LinearContainerFactor(GaussianFactor factor, Values linearizationPoint)
%LinearContainerFactor(GaussianFactor factor, Ordering ordering)
%LinearContainerFactor(GaussianFactor factor)
%
%-------Methods-------
%active(Values c) : returns bool
%clone() : returns gtsam::NonlinearFactor
%dim() : returns size_t
%equals(NonlinearFactor other, double tol) : returns void
%error(Values c) : returns double
%factor() : returns gtsam::GaussianFactor
%isJacobian() : returns bool
%keys() : returns gtsam::KeyVector
%linearize(Values c, Ordering ordering) : returns gtsam::GaussianFactor
%negate(Ordering ordering) : returns gtsam::GaussianFactor
%negate() : returns gtsam::GaussianFactor
%order(Ordering ordering) : returns gtsam::GaussianFactor
%print(string s) : returns void
%printKeys(string s) : returns void
%size() : returns size_t
%toHessian() : returns gtsam::HessianFactor
%toJacobian() : returns gtsam::JacobianFactor
%
%-------Static Methods-------
%convertLinearGraph(GaussianFactorGraph linear_graph, Ordering ordering, Values linearizationPoint) : returns gtsam::NonlinearFactorGraph
%convertLinearGraph(GaussianFactorGraph linear_graph, Ordering ordering) : returns gtsam::NonlinearFactorGraph
%
classdef LinearContainerFactor < gtsam.NonlinearFactor
  properties
    ptr_gtsamLinearContainerFactor = 0
  end
  methods
    function obj = LinearContainerFactor(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(945, varargin{2});
        end
        base_ptr = gtsam_wrapper(944, my_ptr);
      elseif nargin == 3 && isa(varargin{1},'gtsam.GaussianFactor') && isa(varargin{2},'gtsam.Ordering') && isa(varargin{3},'gtsam.Values')
        [ my_ptr, base_ptr ] = gtsam_wrapper(946, varargin{1}, varargin{2}, varargin{3});
      elseif nargin == 2 && isa(varargin{1},'gtsam.GaussianFactor') && isa(varargin{2},'gtsam.Values')
        [ my_ptr, base_ptr ] = gtsam_wrapper(947, varargin{1}, varargin{2});
      elseif nargin == 2 && isa(varargin{1},'gtsam.GaussianFactor') && isa(varargin{2},'gtsam.Ordering')
        [ my_ptr, base_ptr ] = gtsam_wrapper(948, varargin{1}, varargin{2});
      elseif nargin == 1 && isa(varargin{1},'gtsam.GaussianFactor')
        [ my_ptr, base_ptr ] = gtsam_wrapper(949, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.LinearContainerFactor constructor');
      end
      obj = obj@gtsam.NonlinearFactor(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamLinearContainerFactor = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(950, obj.ptr_gtsamLinearContainerFactor);
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
        varargout{1} = gtsam_wrapper(951, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LinearContainerFactor.active');
      end
    end

    function varargout = clone(this, varargin)
      % CLONE usage: clone() : returns gtsam::NonlinearFactor
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % clone()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(952, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LinearContainerFactor.clone');
      end
    end

    function varargout = dim(this, varargin)
      % DIM usage: dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % dim()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(953, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LinearContainerFactor.dim');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(NonlinearFactor other, double tol) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(NonlinearFactor other, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.NonlinearFactor') && isa(varargin{2},'double')
        gtsam_wrapper(954, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LinearContainerFactor.equals');
      end
    end

    function varargout = error(this, varargin)
      % ERROR usage: error(Values c) : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % error(Values c)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Values')
        varargout{1} = gtsam_wrapper(955, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LinearContainerFactor.error');
      end
    end

    function varargout = factor(this, varargin)
      % FACTOR usage: factor() : returns gtsam::GaussianFactor
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % factor()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(956, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LinearContainerFactor.factor');
      end
    end

    function varargout = isJacobian(this, varargin)
      % ISJACOBIAN usage: isJacobian() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % isJacobian()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(957, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LinearContainerFactor.isJacobian');
      end
    end

    function varargout = keys(this, varargin)
      % KEYS usage: keys() : returns gtsam::KeyVector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % keys()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(958, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LinearContainerFactor.keys');
      end
    end

    function varargout = linearize(this, varargin)
      % LINEARIZE usage: linearize(Values c, Ordering ordering) : returns gtsam::GaussianFactor
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % linearize(Values c, Ordering ordering)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.Values') && isa(varargin{2},'gtsam.Ordering')
        varargout{1} = gtsam_wrapper(959, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LinearContainerFactor.linearize');
      end
    end

    function varargout = negate(this, varargin)
      % NEGATE usage: negate(Ordering ordering),  negate() : returns gtsam::GaussianFactor
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % negate(Ordering ordering)
      % negate()
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Ordering')
        varargout{1} = gtsam_wrapper(960, this, varargin{:});
      elseif length(varargin) == 0
        varargout{1} = gtsam_wrapper(961, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LinearContainerFactor.negate');
      end
    end

    function varargout = order(this, varargin)
      % ORDER usage: order(Ordering ordering) : returns gtsam::GaussianFactor
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % order(Ordering ordering)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Ordering')
        varargout{1} = gtsam_wrapper(962, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LinearContainerFactor.order');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(963, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LinearContainerFactor.print');
      end
    end

    function varargout = printKeys(this, varargin)
      % PRINTKEYS usage: printKeys(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % printKeys(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(964, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LinearContainerFactor.printKeys');
      end
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % size()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(965, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LinearContainerFactor.size');
      end
    end

    function varargout = toHessian(this, varargin)
      % TOHESSIAN usage: toHessian() : returns gtsam::HessianFactor
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % toHessian()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(966, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LinearContainerFactor.toHessian');
      end
    end

    function varargout = toJacobian(this, varargin)
      % TOJACOBIAN usage: toJacobian() : returns gtsam::JacobianFactor
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % toJacobian()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(967, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LinearContainerFactor.toJacobian');
      end
    end

  end

  methods(Static = true)
    function varargout = ConvertLinearGraph(varargin)
      % CONVERTLINEARGRAPH usage: convertLinearGraph(GaussianFactorGraph linear_graph, Ordering ordering, Values linearizationPoint),  convertLinearGraph(GaussianFactorGraph linear_graph, Ordering ordering) : returns gtsam::NonlinearFactorGraph
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % CONVERTLINEARGRAPH(GaussianFactorGraph linear_graph, Ordering ordering, Values linearizationPoint)
      % CONVERTLINEARGRAPH(GaussianFactorGraph linear_graph, Ordering ordering)
      if length(varargin) == 3 && isa(varargin{1},'gtsam.GaussianFactorGraph') && isa(varargin{2},'gtsam.Ordering') && isa(varargin{3},'gtsam.Values')
        varargout{1} = gtsam_wrapper(968, varargin{:});
      elseif length(varargin) == 2 && isa(varargin{1},'gtsam.GaussianFactorGraph') && isa(varargin{2},'gtsam.Ordering')
        varargout{1} = gtsam_wrapper(969, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LinearContainerFactor.ConvertLinearGraph');
      end
    end

  end
end
