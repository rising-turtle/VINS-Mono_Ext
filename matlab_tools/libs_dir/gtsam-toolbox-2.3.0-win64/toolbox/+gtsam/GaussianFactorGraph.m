%class GaussianFactorGraph, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%GaussianFactorGraph()
%GaussianFactorGraph(GaussianBayesNet CBN)
%
%-------Methods-------
%add(GaussianFactor factor) : returns void
%add(Vector b) : returns void
%add(size_t key1, Matrix A1, Vector b, Diagonal model) : returns void
%add(size_t key1, Matrix A1, size_t key2, Matrix A2, Vector b, Diagonal model) : returns void
%add(size_t key1, Matrix A1, size_t key2, Matrix A2, size_t key3, Matrix A3, Vector b, Diagonal model) : returns void
%at(size_t idx) : returns gtsam::GaussianFactor
%augmentedHessian() : returns Matrix
%augmentedJacobian() : returns Matrix
%combine(GaussianFactorGraph lfg) : returns void
%eliminateFrontals(size_t nFrontals) : returns pair< SharedGaussianConditional, gtsam::GaussianFactorGraph >
%eliminateOne(size_t j) : returns pair< SharedGaussianConditional, gtsam::GaussianFactorGraph >
%equals(GaussianFactorGraph lfgraph, double tol) : returns bool
%error(VectorValues c) : returns double
%hessian() : returns pair< Matrix, Vector >
%jacobian() : returns pair< Matrix, Vector >
%permuteWithInverse(Permutation inversePermutation) : returns void
%print(string s) : returns void
%probPrime(VectorValues c) : returns double
%push_back(GaussianFactor factor) : returns void
%size() : returns size_t
%sparseJacobian_() : returns Matrix
%
%-------Static Methods-------
%combine2(GaussianFactorGraph lfg1, GaussianFactorGraph lfg2) : returns gtsam::GaussianFactorGraph
%
classdef GaussianFactorGraph < handle
  properties
    ptr_gtsamGaussianFactorGraph = 0
  end
  methods
    function obj = GaussianFactorGraph(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(697, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(698);
      elseif nargin == 1 && isa(varargin{1},'gtsam.GaussianBayesNet')
        my_ptr = gtsam_wrapper(699, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.GaussianFactorGraph constructor');
      end
      obj.ptr_gtsamGaussianFactorGraph = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(700, obj.ptr_gtsamGaussianFactorGraph);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = add(this, varargin)
      % ADD usage: add(GaussianFactor factor),  add(Vector b),  add(size_t key1, Matrix A1, Vector b, Diagonal model),  add(size_t key1, Matrix A1, size_t key2, Matrix A2, Vector b, Diagonal model),  add(size_t key1, Matrix A1, size_t key2, Matrix A2, size_t key3, Matrix A3, Vector b, Diagonal model) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % add(GaussianFactor factor)
      % add(Vector b)
      % add(size_t key1, Matrix A1, Vector b, Diagonal model)
      % add(size_t key1, Matrix A1, size_t key2, Matrix A2, Vector b, Diagonal model)
      % add(size_t key1, Matrix A1, size_t key2, Matrix A2, size_t key3, Matrix A3, Vector b, Diagonal model)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.GaussianFactor')
        gtsam_wrapper(701, this, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'double')
        gtsam_wrapper(702, this, varargin{:});
      elseif length(varargin) == 4 && isa(varargin{1},'numeric') && isa(varargin{2},'double') && isa(varargin{3},'double') && isa(varargin{4},'gtsam.noiseModel.Diagonal')
        gtsam_wrapper(703, this, varargin{:});
      elseif length(varargin) == 6 && isa(varargin{1},'numeric') && isa(varargin{2},'double') && isa(varargin{3},'numeric') && isa(varargin{4},'double') && isa(varargin{5},'double') && isa(varargin{6},'gtsam.noiseModel.Diagonal')
        gtsam_wrapper(704, this, varargin{:});
      elseif length(varargin) == 8 && isa(varargin{1},'numeric') && isa(varargin{2},'double') && isa(varargin{3},'numeric') && isa(varargin{4},'double') && isa(varargin{5},'numeric') && isa(varargin{6},'double') && isa(varargin{7},'double') && isa(varargin{8},'gtsam.noiseModel.Diagonal')
        gtsam_wrapper(705, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianFactorGraph.add');
      end
    end

    function varargout = at(this, varargin)
      % AT usage: at(size_t idx) : returns gtsam::GaussianFactor
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % at(size_t idx)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        varargout{1} = gtsam_wrapper(706, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianFactorGraph.at');
      end
    end

    function varargout = augmentedHessian(this, varargin)
      % AUGMENTEDHESSIAN usage: augmentedHessian() : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % augmentedHessian()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(707, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianFactorGraph.augmentedHessian');
      end
    end

    function varargout = augmentedJacobian(this, varargin)
      % AUGMENTEDJACOBIAN usage: augmentedJacobian() : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % augmentedJacobian()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(708, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianFactorGraph.augmentedJacobian');
      end
    end

    function varargout = combine(this, varargin)
      % COMBINE usage: combine(GaussianFactorGraph lfg) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % combine(GaussianFactorGraph lfg)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.GaussianFactorGraph')
        gtsam_wrapper(709, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianFactorGraph.combine');
      end
    end

    function varargout = eliminateFrontals(this, varargin)
      % ELIMINATEFRONTALS usage: eliminateFrontals(size_t nFrontals) : returns pair< SharedGaussianConditional, gtsam::GaussianFactorGraph >
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % eliminateFrontals(size_t nFrontals)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        [ varargout{1} varargout{2} ] = gtsam_wrapper(710, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianFactorGraph.eliminateFrontals');
      end
    end

    function varargout = eliminateOne(this, varargin)
      % ELIMINATEONE usage: eliminateOne(size_t j) : returns pair< SharedGaussianConditional, gtsam::GaussianFactorGraph >
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % eliminateOne(size_t j)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        [ varargout{1} varargout{2} ] = gtsam_wrapper(711, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianFactorGraph.eliminateOne');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(GaussianFactorGraph lfgraph, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(GaussianFactorGraph lfgraph, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.GaussianFactorGraph') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(712, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianFactorGraph.equals');
      end
    end

    function varargout = error(this, varargin)
      % ERROR usage: error(VectorValues c) : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % error(VectorValues c)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.VectorValues')
        varargout{1} = gtsam_wrapper(713, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianFactorGraph.error');
      end
    end

    function varargout = hessian(this, varargin)
      % HESSIAN usage: hessian() : returns pair< Matrix, Vector >
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % hessian()
      if length(varargin) == 0
        [ varargout{1} varargout{2} ] = gtsam_wrapper(714, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianFactorGraph.hessian');
      end
    end

    function varargout = jacobian(this, varargin)
      % JACOBIAN usage: jacobian() : returns pair< Matrix, Vector >
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % jacobian()
      if length(varargin) == 0
        [ varargout{1} varargout{2} ] = gtsam_wrapper(715, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianFactorGraph.jacobian');
      end
    end

    function varargout = permuteWithInverse(this, varargin)
      % PERMUTEWITHINVERSE usage: permuteWithInverse(Permutation inversePermutation) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % permuteWithInverse(Permutation inversePermutation)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Permutation')
        gtsam_wrapper(716, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianFactorGraph.permuteWithInverse');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(717, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianFactorGraph.print');
      end
    end

    function varargout = probPrime(this, varargin)
      % PROBPRIME usage: probPrime(VectorValues c) : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % probPrime(VectorValues c)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.VectorValues')
        varargout{1} = gtsam_wrapper(718, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianFactorGraph.probPrime');
      end
    end

    function varargout = push_back(this, varargin)
      % PUSH_BACK usage: push_back(GaussianFactor factor) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % push_back(GaussianFactor factor)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.GaussianFactor')
        gtsam_wrapper(719, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianFactorGraph.push_back');
      end
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % size()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(720, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianFactorGraph.size');
      end
    end

    function varargout = sparseJacobian_(this, varargin)
      % SPARSEJACOBIAN_ usage: sparseJacobian_() : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % sparseJacobian_()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(721, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianFactorGraph.sparseJacobian_');
      end
    end

  end

  methods(Static = true)
    function varargout = Combine2(varargin)
      % COMBINE2 usage: combine2(GaussianFactorGraph lfg1, GaussianFactorGraph lfg2) : returns gtsam::GaussianFactorGraph
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % COMBINE2(GaussianFactorGraph lfg1, GaussianFactorGraph lfg2)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.GaussianFactorGraph') && isa(varargin{2},'gtsam.GaussianFactorGraph')
        varargout{1} = gtsam_wrapper(722, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianFactorGraph.Combine2');
      end
    end

  end
end
