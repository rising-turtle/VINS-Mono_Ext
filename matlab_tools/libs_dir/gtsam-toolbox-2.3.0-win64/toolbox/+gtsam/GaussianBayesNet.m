%class GaussianBayesNet, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%GaussianBayesNet()
%GaussianBayesNet(GaussianConditional conditional)
%
classdef GaussianBayesNet < gtsam.GaussianBayesNetBase
  properties
    ptr_gtsamGaussianBayesNet = 0
  end
  methods
    function obj = GaussianBayesNet(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(614, varargin{2});
        end
        base_ptr = gtsam_wrapper(613, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_wrapper(615);
      elseif nargin == 1 && isa(varargin{1},'gtsam.GaussianConditional')
        [ my_ptr, base_ptr ] = gtsam_wrapper(616, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.GaussianBayesNet constructor');
      end
      obj = obj@gtsam.GaussianBayesNetBase(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamGaussianBayesNet = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(617, obj.ptr_gtsamGaussianBayesNet);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
  end

  methods(Static = true)
  end
end
