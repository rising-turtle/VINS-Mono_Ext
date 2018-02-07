%class GaussianBayesNetBase, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Methods-------
%back() : returns gtsam::GaussianConditional
%equals(GaussianBayesNetBase other, double tol) : returns bool
%front() : returns gtsam::GaussianConditional
%permuteWithInverse(Permutation inversePermutation) : returns void
%pop_front() : returns void
%print(string s) : returns void
%printStats(string s) : returns void
%push_back(GaussianConditional conditional) : returns void
%push_back(GaussianBayesNetBase conditional) : returns void
%push_front(GaussianConditional conditional) : returns void
%push_front(GaussianBayesNetBase conditional) : returns void
%saveGraph(string s) : returns void
%size() : returns size_t
%
classdef GaussianBayesNetBase < handle
  properties
    ptr_gtsamGaussianBayesNetBase = 0
  end
  methods
    function obj = GaussianBayesNetBase(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(1781, varargin{2});
        end
        gtsam_wrapper(1780, my_ptr);
      else
        error('Arguments do not match any overload of gtsam.GaussianBayesNetBase constructor');
      end
      obj.ptr_gtsamGaussianBayesNetBase = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(1782, obj.ptr_gtsamGaussianBayesNetBase);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = back(this, varargin)
      % BACK usage: back() : returns gtsam::GaussianConditional
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % back()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1783, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesNetBase.back');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(GaussianBayesNetBase other, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % equals(GaussianBayesNetBase other, double tol)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.GaussianBayesNetBase') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(1784, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesNetBase.equals');
      end
    end

    function varargout = front(this, varargin)
      % FRONT usage: front() : returns gtsam::GaussianConditional
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % front()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1785, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesNetBase.front');
      end
    end

    function varargout = permuteWithInverse(this, varargin)
      % PERMUTEWITHINVERSE usage: permuteWithInverse(Permutation inversePermutation) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % permuteWithInverse(Permutation inversePermutation)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Permutation')
        gtsam_wrapper(1786, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesNetBase.permuteWithInverse');
      end
    end

    function varargout = pop_front(this, varargin)
      % POP_FRONT usage: pop_front() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % pop_front()
      if length(varargin) == 0
        gtsam_wrapper(1787, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesNetBase.pop_front');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1788, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesNetBase.print');
      end
    end

    function varargout = printStats(this, varargin)
      % PRINTSTATS usage: printStats(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % printStats(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1789, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesNetBase.printStats');
      end
    end

    function varargout = push_back(this, varargin)
      % PUSH_BACK usage: push_back(GaussianConditional conditional),  push_back(GaussianBayesNetBase conditional) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % push_back(GaussianConditional conditional)
      % push_back(GaussianBayesNetBase conditional)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.GaussianConditional')
        gtsam_wrapper(1790, this, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'gtsam.GaussianBayesNetBase')
        gtsam_wrapper(1791, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesNetBase.push_back');
      end
    end

    function varargout = push_front(this, varargin)
      % PUSH_FRONT usage: push_front(GaussianConditional conditional),  push_front(GaussianBayesNetBase conditional) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % push_front(GaussianConditional conditional)
      % push_front(GaussianBayesNetBase conditional)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.GaussianConditional')
        gtsam_wrapper(1792, this, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'gtsam.GaussianBayesNetBase')
        gtsam_wrapper(1793, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesNetBase.push_front');
      end
    end

    function varargout = saveGraph(this, varargin)
      % SAVEGRAPH usage: saveGraph(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % saveGraph(string s)
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1794, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesNetBase.saveGraph');
      end
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % size()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1795, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesNetBase.size');
      end
    end

  end

  methods(Static = true)
  end
end
