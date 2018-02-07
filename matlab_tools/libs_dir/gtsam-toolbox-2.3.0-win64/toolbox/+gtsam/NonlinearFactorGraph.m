%class NonlinearFactorGraph, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%NonlinearFactorGraph()
%NonlinearFactorGraph(NonlinearFactorGraph graph)
%
%-------Methods-------
%add(NonlinearFactor factor) : returns void
%at(size_t i) : returns gtsam::NonlinearFactor
%clone() : returns gtsam::NonlinearFactorGraph
%empty() : returns bool
%equals(NonlinearFactorGraph fg, double tol) : returns bool
%error(Values values) : returns double
%linearize(Values values, Ordering ordering) : returns gtsam::GaussianFactorGraph
%nrFactors() : returns size_t
%orderingCOLAMD(Values values) : returns gtsam::Ordering
%print(string s) : returns void
%probPrime(Values values) : returns double
%push_back(NonlinearFactorGraph factors) : returns void
%remove(size_t i) : returns void
%size() : returns size_t
%symbolic(Ordering ordering) : returns gtsam::SymbolicFactorGraph
%
classdef NonlinearFactorGraph < handle
  properties
    ptr_gtsamNonlinearFactorGraph = 0
  end
  methods
    function obj = NonlinearFactorGraph(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(832, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(833);
      elseif nargin == 1 && isa(varargin{1},'gtsam.NonlinearFactorGraph')
        my_ptr = gtsam_wrapper(834, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.NonlinearFactorGraph constructor');
      end
      obj.ptr_gtsamNonlinearFactorGraph = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(835, obj.ptr_gtsamNonlinearFactorGraph);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = add(this, varargin)
      % ADD usage: add(NonlinearFactor factor) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % add(NonlinearFactor factor)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.NonlinearFactor')
        gtsam_wrapper(836, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearFactorGraph.add');
      end
    end

    function varargout = at(this, varargin)
      % AT usage: at(size_t i) : returns gtsam::NonlinearFactor
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % at(size_t i)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        varargout{1} = gtsam_wrapper(837, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearFactorGraph.at');
      end
    end

    function varargout = clone(this, varargin)
      % CLONE usage: clone() : returns gtsam::NonlinearFactorGraph
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % clone()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(838, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearFactorGraph.clone');
      end
    end

    function varargout = empty(this, varargin)
      % EMPTY usage: empty() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % empty()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(839, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearFactorGraph.empty');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(NonlinearFactorGraph fg, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(NonlinearFactorGraph fg, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.NonlinearFactorGraph') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(840, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearFactorGraph.equals');
      end
    end

    function varargout = error(this, varargin)
      % ERROR usage: error(Values values) : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % error(Values values)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Values')
        varargout{1} = gtsam_wrapper(841, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearFactorGraph.error');
      end
    end

    function varargout = linearize(this, varargin)
      % LINEARIZE usage: linearize(Values values, Ordering ordering) : returns gtsam::GaussianFactorGraph
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % linearize(Values values, Ordering ordering)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.Values') && isa(varargin{2},'gtsam.Ordering')
        varargout{1} = gtsam_wrapper(842, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearFactorGraph.linearize');
      end
    end

    function varargout = nrFactors(this, varargin)
      % NRFACTORS usage: nrFactors() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % nrFactors()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(843, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearFactorGraph.nrFactors');
      end
    end

    function varargout = orderingCOLAMD(this, varargin)
      % ORDERINGCOLAMD usage: orderingCOLAMD(Values values) : returns gtsam::Ordering
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % orderingCOLAMD(Values values)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Values')
        varargout{1} = gtsam_wrapper(844, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearFactorGraph.orderingCOLAMD');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(845, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearFactorGraph.print');
      end
    end

    function varargout = probPrime(this, varargin)
      % PROBPRIME usage: probPrime(Values values) : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % probPrime(Values values)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Values')
        varargout{1} = gtsam_wrapper(846, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearFactorGraph.probPrime');
      end
    end

    function varargout = push_back(this, varargin)
      % PUSH_BACK usage: push_back(NonlinearFactorGraph factors) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % push_back(NonlinearFactorGraph factors)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.NonlinearFactorGraph')
        gtsam_wrapper(847, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearFactorGraph.push_back');
      end
    end

    function varargout = remove(this, varargin)
      % REMOVE usage: remove(size_t i) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % remove(size_t i)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        gtsam_wrapper(848, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearFactorGraph.remove');
      end
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % size()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(849, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearFactorGraph.size');
      end
    end

    function varargout = symbolic(this, varargin)
      % SYMBOLIC usage: symbolic(Ordering ordering) : returns gtsam::SymbolicFactorGraph
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % symbolic(Ordering ordering)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Ordering')
        varargout{1} = gtsam_wrapper(850, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearFactorGraph.symbolic');
      end
    end

  end

  methods(Static = true)
  end
end
